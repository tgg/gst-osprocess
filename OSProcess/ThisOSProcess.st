OSProcess subclass: ThisOSProcess [

    ThisOSProcess class [ | uniqueInstance | ]

    ThisOSProcess class >> uniqueInstance [
	<category: 'accessing'>

	^ uniqueInstance ifNil: [ uniqueInstance := self new ]
    ]

    ThisOSProcess class >> daemon: anInteger1 noclose: anInteger2 [
	<category: 'private daemon'>

	<cCall: 'daemon' returning: #long args: #(#long #long)>
    ]

    ThisOSProcess class >> exec: command args: args [
	<category: 'private exec'>

	| argv i |
	"first arg is command, last is NUL terminator"
	argv := (CStringType arrayType: args size + 2) gcNew.
	i := 0.
	argv at: i put: command.
	i := 1.
	args do: [ :arg |
	    argv at: i put: arg.
	    i := i + 1. ].
	^ self execvp: command args: argv
    ]

    ThisOSProcess class >> execvp: command args: args [
	<category: 'private exec'>

	<cCall: 'execvp' returning: #int args: #(#string (#ptr #string))>
    ]

    pid [
        <category: 'process'>

        <cCall: 'getpid' returning: #long args: #()>
    ]

    parentPid [
        <category: 'process'>

        <cCall: 'getppid' returning: #long args: #()>
    ]

    fork [
        <category: 'process'>

        <cCall: 'fork' returning: #long args: #()>
    ]

    daemon [
	<category: 'daemon'>

	self class daemon: 0 noclose: 0
    ]

    forkAndDo: aBlock [
        <category: 'process'>

        | childPid |
        childPid := self fork.
        ^ childPid == 0
            ifTrue: [
                aBlock value.
                ThisOSProcess uniqueInstance ]
            ifFalse: [ ExternalOSProcess pid: childPid ]
    ]

    forkAndExec: command with: args [
        <category: 'process'>

        ^ self forkAndDo: [ self class exec: command args: args ]
    ]

    forkAndExec: command [
        <category: 'process'>

        ^ self forkAndExec: command with: #()
    ]
]

