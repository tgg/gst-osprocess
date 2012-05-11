OSProcess subclass: ExternalOSProcess [

    <category: 'OSProcess'>

    ExternalOSProcess class >>  pid: anInteger [
	<category: 'instance creation'>

	^ self new
	    pid: anInteger;
	    yourself
    ]

    ExternalOSProcess class >> waitpid: pid status: anIntPtr options: anInteger [
	<category: 'private wait'>

	<cCall: 'waitpid' returning: #long args: #(#long (#ptr #int) #int)>
    ]

    | pid |

    pid: anInteger [
	<category: 'initialization'>

	pid := anInteger
    ]

    pid [
	<category: 'process'>

	^ pid
    ]

    wait [
	<category: 'process'>

	self class waitpid: pid status: nil options: 0
    ]
]

"Eval [

    | process |
    DLD addLibrary: 'libc'.
    process := ThisOSProcess uniqueInstance forkAndDo: [ 'Hello World' printNl. [ 'true' printNl. true ] whileTrue ].
    process inspect.
    process sigKill.
]"

