### How can I easily detect performance problems and debug it?

[LatencyMon](http://www.resplendence.com/latencymon) might not correct everything correctly, so there is an "official" and better way to do this.


### Requirements

* Windows 10 OS
* [Windows Performance Toolkit](https://docs.microsoft.com/en-us/windows-hardware/get-started/adk-install)


### HowTo

Launch elevated command prompt and execute to start the trace

```bash
cd "C:\Program Files (x86)\Windows Kits\10\Windows Performance Toolkit"
xperf -on base+interrupt+dpc
```

1. Run the game, the video, or whatever you are trying to troubleshoot.

2. Return to command prompt to stop the trace and to save the trace file:

```bash
xperf -d c:\temp\trace.etl
```

Choose your own path and name for that trace file.

Generate the text report file for DPCs and ISRs:

```bash
xperf -i c:\temp\trace.etl -o c:\temp\report.txt -a dpcisr
```

Now you can open that text report file to browse quite detailed info about DPCs & ISRs.


### Legend

* us/usec/usecs = microseconds
