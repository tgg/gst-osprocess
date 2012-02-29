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
]

