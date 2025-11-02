LOVELY_INTEGRITY = 'f84115d2979398f0d569473b4b4f8abb89bd1102e40d8ee1f06c162262395c91'

_RELEASE_MODE = true
_DEMO = false

function love.conf(t)
	t.console = not _RELEASE_MODE
	t.title = 'Balatro'
	t.externalstorage = true
	t.window.width = 0
    t.window.height = 0
	t.window.minwidth = 100
	t.window.minheight = 100
end 
