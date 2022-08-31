function onEvent(name, value1, value2)
    if name == "bounce" then
        characterPlayAnim('boyfriend', 'bump', true);
        setProperty('boyfriend.specialAnim', true);
    end
end