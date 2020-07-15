default : event-storming.png

%.png : %.txt
	./run-plantuml.sh $< $@
