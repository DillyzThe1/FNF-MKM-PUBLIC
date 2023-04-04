function onChartAccessed()
	--contradictory
		triggerEvent("Change Character", "gf", "lazer")
		playAnim("gf","singUP-alt")
		triggerEvent("Change Character", "gf", "gf")
	return Function_Stop
end