extends Node2D

func clearRows():
	for i in $rows.get_children():
		i.resetPattern()
