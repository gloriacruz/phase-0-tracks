What are some of the key design philosophies of the Linux operating system?
According to Mike Gancarz:
-Small is beautiful
-Make each program do one thing well
-Build a prototype as soon as possible
-Choose portability over efficiency
-Store data in flat text files
-Use software leverage to your advantage
-Use shell scripts to increase leverage and portability
-Avoid captive user interfaces
-Make every program and filter

In your own words, what is a VPS (virtual private server)? What, according to your research, are the advantages of using a VPS?
It's a virtual machine that acts as a hosting server. It runs its own operating system and you can install any software appropriate for the OS. The VPS provides the customer with superuser-level access.

Optional bonus question: Why is it considered a bad idea to run programs as the root user on a Linux system?
It's mainly for security reason, applications are meant to run with a non-administrative role security, otherwise, they are running with root privileges. If you run programs as root, any vulnerability or defect in the software would compromise your entire system or affect your files.