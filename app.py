import json 
import time 
import threading 
from flask import Flask, jsonify, send_from_directory
import subprocess
import os

# Load device map
device_map_path = os.path.join(os.path.dirname(__file__), 'Data', 'device_map.json')
with open(device_map_path, 'r') as f:
    device_map = json.load(f)
    print(list(device_map))

# Shared status dictionary
device_status = {}

# Ping function
def ping_device(ip):
    try:
        output = subprocess.check_output(['ping', '-n', '1', ip], universal_newlines=True)
        return "TTL=" in output
    except subprocess.CalledProcessError:
        return False

# Heartbeat loop
def heartbeat():
    interval = 1  # seconds
    while True: 
        print("Heartbeat running...")  # Add this line
        for ip, info in device_map.items():
            is_online = ping_device(ip)
            device_status[ip] = {
                'name': info['name'],
                'lane': info['lane'],
                'status': 'online' if is_online else 'offline'
            }
        time.sleep(interval)

# Start heartbeat in background
threading.Thread(target=heartbeat, daemon=True).start()

# Flask app
app = Flask(__name__)
app.config['TEMPLATES_AUTO_RELOAD'] = True


@app.route('/', methods=['GET'])
def index():
    return send_from_directory('static', 'index.html')

@app.route('/status', methods=['GET'])
def get_status():
    return jsonify(device_status)

# Serve CSS and other static files
@app.route('/<path:filename>')
def static_files(filename):
    return send_from_directory('static', filename)


from flask import request

@app.route('/api/devices', methods=['GET'])
def get_devices():
    return jsonify(device_map)

@app.route('/api/devices', methods=['POST'])
def add_device():
    data = request.json
    ip = data.get('ip')
    info = data.get('info', {})
    if ip:
        device_map[ip] = info
        with open(device_map_path, 'w') as f:
            json.dump(device_map, f, indent=2)
        return jsonify({'success': True}), 201
    return jsonify({'success': False, 'error': 'No IP provided'}), 400

@app.route('/api/devices/<ip>', methods=['PUT'])
def edit_device(ip):
    data = request.json
    if ip in device_map:
        device_map[ip] = data.get('info', {})
        with open(device_map_path, 'w') as f:
            json.dump(device_map, f, indent=2)
        return jsonify({'success': True})
    return jsonify({'success': False, 'error': 'Device not found'}), 404


@app.route('/api/devices/<ip>', methods=['DELETE'])
def remove_device(ip):
    if ip in device_map:
        del device_map[ip]
        with open(device_map_path, 'w') as f:
            json.dump(device_map, f, indent=2)
        return jsonify({'success': True})
    return jsonify({'success': False, 'error': 'Device not found'}), 404

@app.after_request
def add_header(response):
    response.headers['Cache-Control'] = 'no-store, no-cache, must-revalidate, max-age=0'
    response.headers['Pragma'] = 'no-cache'
    response.headers['Expires'] = '0'
    return response

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=True)