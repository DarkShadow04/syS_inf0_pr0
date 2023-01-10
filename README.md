<!DOCTYPE html>
<html>
<head>
</head>
<body>
  <h1>System Info Script</h1>
  <p>A simple bash script to display various system information including system details, distribution details, hardware details, and storage details.</p>

  <h2>Usage</h2>
  <p>Run the script in the terminal with <code>sudo ./system_info.sh</code>.</p>
  <pre>
  <code>
    chmod +x system_info.sh
    ./system_info.sh
  </code>
  </pre>

  <h2>Dependencies</h2>
  <p>The script relies on the following dependencies:</p>
  <ul>
    <li>lsb-release</li>
    <li>lshw</li>
    <li>enscript</li>
  </ul>
  <p>If any of these dependencies are missing, the script will automatically install them.</p>

  <h2>Features</h2>
  <ul>
    <li>The script displays system information, distribution information, hardware information, and available disk space.</li>
    <li>The script also lists top 30 largest files and directories in the current directory.</li>
    <li>The script has beautiful random color banner and system_info details.</li>
    <li>The script also has a feature to generate a pdf report of all the information, when the user selects yes.</li>
    <li>The script also has a website link and the copyright signature of the author.</li>
  </ul>
  
  <h2>
