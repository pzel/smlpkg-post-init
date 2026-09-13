fun main () =
	runTestsWith [T (fn _=> fail "implement me")] (CommandLine.arguments())
