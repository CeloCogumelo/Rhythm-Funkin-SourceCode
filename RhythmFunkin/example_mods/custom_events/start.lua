function onEvent(name, value1, value2)
    if name == "start" then
        characterPlayAnim('boyfriend', 'Start', true);
        setProperty('boyfriend.specialAnim', true);
    end
end