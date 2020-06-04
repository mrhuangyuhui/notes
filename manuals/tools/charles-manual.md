# Charles Manual

https://www.charlesproxy.com/

https://www.charlesproxy.com/documentation/

Configuration

https://www.charlesproxy.com/documentation/configuration/

Browser & System Configuration
https://www.charlesproxy.com/documentation/configuration/browser-and-system-configuration/

iOS Device Settings
To use Charles as your HTTP proxy on your iPhone you must manually configure the HTTP Proxy settings on your WiFi network in your iPhone's Settings.

Go to the Settings app, tap Wi-Fi, find the network you are connected to and then tap it to configure the network. Scroll down to the HTTP Proxy setting, tap Manual. Enter the IP address of your computer running Charles in the Server field, and the port Charles is running on in the Port field (usually 8888). Leave Authentication set to Off.

All of your web traffic from your iPhone will now be sent via Charles. You should see a prompt in Charles when you first make a connection from the iPhone, asking you to allow the traffic. Allow this connection. The IP address of your iPhone will be added to the Access Control list in Charles, which you can view and change in the Proxy menu > Access Control Settings.

Remember to disable the HTTP Proxy in your Settings when you stop using Charles, otherwise you'll get confusing network failures in your applications!

Proxy Settings
https://www.charlesproxy.com/documentation/configuration/proxy-settings/

External Proxies
https://www.charlesproxy.com/documentation/configuration/external-proxies/

Using Charles

https://www.charlesproxy.com/documentation/using-charles/

SSL Certificates
https://www.charlesproxy.com/documentation/using-charles/ssl-certificates/

macOS
In Charles go to the Help menu and choose "SSL Proxying > Install Charles Root Certificate". Keychain Access will open. Find the "Charles Proxy..." entry, and double-click to get info on it. Expand the "Trust" section, and beside "When using this certificate" change it from "Use System Defaults" to "Always Trust". Then close the certificate info window, and you will be prompted for your Administrator password to update the system trust settings.


Proxying

https://www.charlesproxy.com/documentation/proxying/

SSL Proxying
https://www.charlesproxy.com/documentation/proxying/ssl-proxying/

