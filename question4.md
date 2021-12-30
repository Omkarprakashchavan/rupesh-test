1. You type google.com into the address bar of your browser.
2. The browser checks the cache for a DNS record to find the corresponding IP address of google.com.
DNS(Domain Name System) is a database that maintains the name of the website (URL) and the particular IP address it links to. Every single URL on the internet has a unique IP address assigned to it. It is easier to remember the name of the website using a URL and let DNS do the work for us by mapping it to the correct IP.
To find the DNS record, the browser checks four caches.
● First, it checks the browser cache. The browser maintains a repository of DNS records for a fixed duration for websites you have previously visited. So, it is the first place to run a DNS query.
● Second, the browser checks the OS cache. If it is not in the browser cache, the browser will make a system call to your underlying computer OS to fetch the record since the OS also maintains a cache of DNS records.
● Third, it checks the router cache. The browser will communicate with the router that maintains its’ own cache of DNS records.
● Fourth, it checks the ISP cache. If all steps fail, the browser will move on to the ISP. Which includes a cache of DNS records, which the browser would check with the last hope of finding your requested URL.
3. If the requested URL is not in the cache, ISP’s DNS server initiates a DNS query to find the IP address of the server that hosts google.com.
DNS query is to search multiple DNS servers on the internet until it finds the correct IP address for the website. This type of search is called a recursive search since the search will repeatedly continue from a DNS server to a DNS server until it either finds the IP address we need or returns an error response saying it was unable to find it.
4. The browser initiates a TCP connection with the server.
Once the browser receives the correct IP address, it will build a connection with the server that matches the IP address to transfer information. Browsers use internet protocols to build such connections. There are several different internet protocols that can be used, but TCP is the most common protocol used for many types of HTTP requests.
To transfer data packets between your browser and the server, it is important to have a TCP connection established. This connection is established using a process called the TCP/IP three-way handshake. This is a three-step process where the client and the server exchange SYN(synchronize) and ACK(acknowledge) messages to establish a connection.
● The client machine sends a SYN packet to the server over the internet, asking if it is open for new connections.
● If the server has open ports that can accept and initiate new connections, it’ll respond with an ACKnowledgment of the SYN packet using a SYN/ACK packet.
● The client will receive the SYN/ACK packet from the server and will acknowledge it by sending an ACK packet.
Then a TCP connection is established for data transmission!
5. The browser sends an HTTP request to the webserver.
Once the TCP connection is established, it is time to start transferring data
6. The server handles the request and sends back a response.
7. The server sends out an HTTP response.
8. The browser displays the HTML content