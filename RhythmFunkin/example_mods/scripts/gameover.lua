function onGameOver()
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'TryAgain');
	setPropertyFromClass('GameOverSubstate', 'endSoundName', 'TryAgainEnd');
end