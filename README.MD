# kill-processes

Kill processes is a script to be installed as a launchd job to kill some of the bloatware and other processes that Mac OS X makes it so difficult to disable.

## Install

By default it will run once every hour. If need to change some params (or the install directory) edit the plist file before installing.

```bash
. .env >/dev/null 2>&1

if [ -z "$AGENT_NAME" ]; then
    [ $1 ] && echo "You should create .env file and set AGENT_NAME variable in the agent's root directory" && exit 1
fi

LAUNCH_AGENTS_ROOT="$HOME/Library/LaunchAgents"
launchdPlist=$AGENT_NAME.plist
cp launchd/$launchdPlist $LAUNCH_AGENTS_ROOT
cd $LAUNCH_AGENTS_ROOT
launchctl load $launchdPlist
launchctl list | grep $AGENT_NAME
```
