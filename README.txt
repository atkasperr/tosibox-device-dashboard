TOSIBOX Device Dashboard - Setup & Usage Guide
==============================================

What is this?
-------------
The TOSIBOX Device Dashboard is a simple, open source tool that lets you view and access devices on your network, grouped by lane or section, using a web browser. It runs a small server on your computer and shows device status in real time. The dashboard is designed to work seamlessly with TOSIBOX remote access solutions, making it easy to manage and monitor devices connected through your TOSIBOX Key.

How to Set Up
-------------
1. **Connect to Your TOSIBOX Key**
   - Before using the dashboard, open your TOSIBOX Key software and connect to your TOSIBOX key.
   - Make sure you are connected to only one key at a time. This ensures the dashboard can properly detect available devices in your TOSIBOX network.

2. **Copy the Folder**
   - Place the entire "RIS Dashboard" folder in your user profile directory (e.g., `C:\Users\YourName\RIS Dashboard`).

3. **Create a Desktop Shortcut (Recommended)**
   - To make starting the dashboard easy, run the `create_shortcut.ps1` PowerShell script inside the "RIS Dashboard" folder:
     - Right-click `create_shortcut.ps1` and select "Run with PowerShell".
     - This will add a shortcut called "Start Device Dashboard" to your Desktop.

   - Alternatively, you can manually copy `start_dashboard.bat` to your Desktop for quick access.

4. **Start the Dashboard**
   - Double-click the "Start Device Dashboard" shortcut on your Desktop (or run `start_dashboard.bat` directly).
   - A window will check for Python and Flask, then start the dashboard server in a new window.
   - Follow the on-screen instructions.

5. **Using the Dashboard**
   - Once started, open your web browser and go to: [http://localhost:5000](http://localhost:5000)
   - You will see a list of devices grouped by lane or section, as defined in your TOSIBOX network.
   - Click any device name to open its web interface.

6. **Stopping the Dashboard**
   - When finished, return to the original window and press any key.
   - Both the dashboard and server windows will close.

TOSIBOX Integration Details
---------------------------
- The dashboard is designed to work with devices accessible via your TOSIBOX Key.
- Only devices visible in your current TOSIBOX session will be shown.
- If you connect to multiple keys at once, device detection may not work as expected. Always connect to a single TOSIBOX key for best results.
- You can customize device names, lanes, and other details by editing the `Data\device_map.json` file.

Troubleshooting
---------------
- **Python Not Installed:**  
  If you see a message that Python is not installed, download and install Python 3.9 or newer from:  
  https://www.python.org/downloads/

- **Flask Not Installed:**  
  The script will attempt to install Flask automatically if it is missing.

- **Devices Missing?**  
  If you see a device in your TOSIBOX network but not on the dashboard, edit `Data\device_map.json` and add the device using the same format as the others.

- **Need Help?**  
  See the "How To" tab in the dashboard or open `static\howto.html` for step-by-step instructions.

Contact
-------
For questions or support, contact: Andrew Kasper  
Email: atkasper@umich.edu

Enjoy using the TOSIBOX Device Dashboard!