compile:
	erl -make
	
clean:
	rm ebin/*.beam

run: compile
	erl -pa ebin
