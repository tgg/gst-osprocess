Object subclass: OSProcess [

    <category: 'OSProcess'>

    OSProcess class >> new [
	<category: 'instance creation'>

	^ super new
	    initialize;
	    yourself
    ]

    OSProcess class >> kill: aPid signal: anInteger [
        <category: 'private signaling'>

        <cCall: 'kill' returning: #long args: #(#long #long)>
    ]

    initialize [
	<category: 'initialization'>

    ]

    pid [
	<category: 'process'>

    ]

    sigAbort [
	<category: 'signaling'>

	^ self signal: 6	
    ]

    sigAlarm [
	<category: 'signaling'>
	
	^ self signal: 14
    ]

    sigChild [
	<category: 'signaling'>
	
	^ self signal: 17
    ]

    sigCont [
	<category: 'signaling'>
	
	^ self signal: 18
    ]

    sigHup [
	<category: 'signaling'>
	
	^ self signal: 1
    ]

    sigInt [
	<category: 'signaling'>
	
	^ self signal: 2
    ]

    sigKill [
	<category: 'signaling'>
	
	^ self signal: 9
    ]

    sigPipe [
	<category: 'signaling'>
	
	^ self signal: 13
    ]

    sigQuit [
	<category: 'signaling'>
	
	^ self signal: 3
    ]

    sigStop [
	<category: 'signaling'>

	^ self signal: 19	
    ]

    sigTerm [
	<category: 'signaling'>
	
	^ self signal: 15
    ]

    sigUsr1 [
	<category: 'signaling'>
	
	^ self signal: 10
    ]

    sigUsr2 [
	<category: 'signaling'>
	
	^ self signal: 12
    ]

    signal: anInteger [
	<category: 'signaling'>

	^ self class kill: self pid signal: anInteger
    ]
]

