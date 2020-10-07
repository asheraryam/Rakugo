extends Dialogue

var path_choice = ''

func some_dialog():
	start_event("some_dialog")


	say(null, "Show 'rect red', step #%d" % get_event_step())
	show("rect red")
	step()
	
	say(null, "Show 'rect blue', step #%d" % get_event_step())
	show("rect blue")
	step()
	
	say(null, "Hide 'rect red', step #%d" % get_event_step())
	hide("rect red")
	step()
	
	say(null, "Little test of the choice menu")
	var choice = menu([["Choice 1", 1, {'visible':true}], ["Choice 2", 2, {'visible':true}],["Choice 3", 3, {'visible':false}]])
	step()
	
	say(null, "You chose '%s' (not saved)" % str(choice))
	step()
	
	say(null, "Show 'rect'(inexistant), step #%d" % get_event_step())
	show("rect")
	step()
	
	say(null, "Hide 'rect', step #%d" % get_event_step())
	hide("rect")
	step()
	
	say(null, "Select a path")
	show("rect red")
	show("pathchoice")
	step()
	
	if cond(path_choice == 'green'):
		say(null, "Green path chosen, yeah fuck blue")
		show("rect green")
		hide("pathchoice")
		step()
		
		say(null, "Step #%d Green" % get_event_step())
		step()
		say(null, "Step #%d Green" % get_event_step())
		step()
		say(null, "Step #%d Green" % get_event_step())
		step()
	elif cond(path_choice == 'blue'):
		say(null, "Blue FTW, Green is for tards, amiright")
		show("rect blue")
		hide("pathchoice")
		step()
		
		say(null, "Step #%d Blue" % get_event_step())
		step()
		say(null, "Step #%d Blue" % get_event_step())
		step()
		say(null, "Step #%d Blue" % get_event_step())
		step()
		say(null, "Step #%d Blue" % get_event_step())
		step()
	else:
		say(null, "Haha you did the right thing not picking of those inferior colors, ")
		hide("pathchoice")
		step()
		
		say(null, "Step #%d RED" % get_event_step())
		step()
		say(null, "Step #%d RED" % get_event_step())
		step()
		say(null, "Step #%d RED" % get_event_step())
		step()
		say(null, "Step #%d RED" % get_event_step())
		step()
		say(null, "Step #%d RED" % get_event_step())
		step()
		
	say(null, "Step #%d" % get_event_step())
	step()
	say(null, "Step #%d" % get_event_step())
	step()
	
	end_event()


func _on_green_path_chosen():
	self.path_choice = "green"
	Rakugo.story_step()


func _on_blue_path_chosen():
	self.path_choice = "blue"
	Rakugo.story_step()
