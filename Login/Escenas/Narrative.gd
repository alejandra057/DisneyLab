extends Control
var segundos = 0

func _ready():
	pass 

var parrafo: int=0
var contador: int=0
var enterPressed: bool=true
var reproducido = true


func start(Text:String,image:Texture,audios: AudioStream)->void:
	$CanvasLayer.show()
	$CanvasLayer/Label.text = Text
	$CanvasLayer/Image.texture = image
	$CanvasLayer/Audios.stream = audios
	$CanvasLayer/Audios.play()
	$CanvasLayer/AnimationPlayer.play("type")
	

func _process(delta):
	segundos+=1
	print(segundos)
	if(parrafo==0 && reproducido == true):
		reproducido=false
		start(textos[0],images[0],audio[0])
	if segundos >= 100:
		$CanvasLayer/Label2.show()
		if Input.is_key_pressed(KEY_ENTER):
			parrafo+=1
			$CanvasLayer/Label2.hide()
			segundos=0
			if 7<parrafo:
				get_tree().change_scene_to_file("res://Escenas/mundo_principal.tscn") 
			else:
				start(textos[parrafo],images[parrafo],audio[parrafo])

const images : Dictionary ={
	0 : preload("res://Art/Imagenes Narrativa/1era_image.jpeg"),
	1 : preload("res://Art/Imagenes Narrativa/2da_imagen.jpg"),
	2 : preload("res://Art/Imagenes Narrativa/3era_imagen.jpg"),
	3 : preload("res://Art/Imagenes Narrativa/4ta_imagen.jpg"),
	4 : preload("res://Art/Imagenes Narrativa/7ma_imagen.jpg"),
	5 : preload("res://Art/Imagenes Narrativa/5ta_iamgen.jpg"),
	6 : preload("res://Art/Imagenes Narrativa/6ta_imagen.jpg"),
	7 : preload("res://Art/Escenarios_Mundos/54500.png"),
	8 : ""
}

const audio : Dictionary ={
	0 : preload("res://Art/Sounds/1er_parrafo.mp3"),
	1 : preload("res://Art/Sounds/2do_parrafo.mp3"),
	2 : preload("res://Art/Sounds/3er_parrafo.mp3"),
	3 : preload("res://Art/Sounds/4to_parrafo.mp3"),
	4 : preload("res://Art/Sounds/5to_parrafo.mp3"),
	5 : preload("res://Art/Sounds/6to_parrafo.mp3"),
	6 : preload("res://Art/Sounds/7mo_parrrafo.mp3"),
	7 : preload("res://Art/Sounds/8vo_parrafo.mp3"),
	8 : ""
}


const textos : Array = [
"En la segunda mitad del siglo XIV, las personas cultas en Italia insisten en que se ha producido un cambio 
fundamental en la actitud de los hombres frente al mundo y a la vida, denominado humanismo. ",#0

"Están convencidos que se ha producido “una ruptura radical con el mundo medieval” y tratan de entender 
cuál es el significado del cambio, luego para final del mismo siglo y durante el siglo XV, los reyes
aprovecharon la crisis del feudalismo para retomar su poder", #1

"lo que supone el Renacimiento del hombre, de la cultura y la sociedad,pero sobre todo de 
transformaciones en los mecanismos del gobierno y en el ejercicio del poder,respaldado por la burguesía.", #2

"El tratado de Paz firmado en Westfalia que finalizó la Guerra de los Treinta Años en Alemania y la
Guerra de los ochenta años entre España y los Países Bajos en 1648,dio origen al Estado Nacional,
replanteando los principios de soberanía y de integridad territorial en las naciones europeas.", #3

"En el campo de la filosofía, después de la revolución científica, se revaloriza al hombre como
sujeto de la razón, suscitando una visión antropocéntrica de la filosofía, la ciencia y otras disciplinas.
En el terreno de la epistemología, uno de los cuales enfrentará a ", #4

"los racionalistas (quienes afirmaban que el conocimiento se origina en la razón a través de las
ideas innatas) frente a los empiristas (quienes afirmaban que el conocimiento se origina en las
experiencias sensibles, a través de los sentidos).", #5

"A continuación, te invitamos a acompañarnos en este viaje cognitivo. Vas a seguir un trayecto a través 
de distintos niveles, que deberás seguir con responsabilidad. En el primero denominada ruleta del saber,
inicias un nivel de entrenamiento donde vas a cargar vidas para los siguientes niveles", #6

"en el siguiente nivel denominado de andamiaje, vas asumiendo retos y guías mientras sumas puntos
hasta llegar al nivel de dominio, nivel de experto.",#7 
"" #8

		
]
