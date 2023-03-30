## TALLER DE RSTUDIO SOCIODEMOGRAFIA
#CÓDGIO POR CELESTE DÍAZ 
#FACULTAD DE CIENCIAS POLÍTICAS Y SOCIALES 
#29/03/2023

##INTRODUCCIÓN ♡( ◡‿◡ )  -----
# ✿ OPERACIONES MATEMATICAS ✿
#R nos sirve para hacer operaciones matemáticas sencillas 
2+2
3*4
sqrt(12) #Esto es un comando, nos sirve para darle instrucciones a R.

# ✿ DECLARACION DE OBJETOS ✿

"dolar" <- 18.09 #Usamos las flechitas para decirle a R qué significa cada obj.
dolar #Si sólo ponemos el nombre del objeto nos da el valor al que equivale
#¿Cuál es el valor neto del artista J-Hope en pesos 
#si se estima que es de 26 millones de USD?
26000000*dolar #Podemos utilizar los objetos para realizar operaciones
"JHope" <- 26000000*dolar
JHope 

##INSTALAR PAQUETERÍAS (´ ε ` )♡ -------
#Primero tenemos que limpiar nuestro ambiente seleccionando la escobita para 
#que no se sobrecargue la RAM 
#Ahora toca cargar los paquetes
install.packages("dplyr") #El comando install.packages nos sirve para descargar los paquetes
install.packages("janitor")
if (!require("pacman")) install.packages("pacman") #Este comando instala pacman sólo si es necesario

#¿Para qué descargamos esto? Habilitan los comandos que vamos a usar 
library(dplyr)
library(janitor)
#Activamos paqueterías instaladas

##IMPORTAR BASES DE DATOS ♡(｡- ω -) ------
library(readxl)
X1_Composici_n_y_estructura_de_la_poblaci_n <- read_excel("datos /1. Composici¢n y estructura de la poblaci¢n.xlsx", 
                                                            +     sheet = "importar")
View(X1_Composici_n_y_estructura_de_la_poblaci_n) 
  
##REVISAR BASES DE DATOS ٩(◕‿◕｡)۶ ------
#Le cambiamos el nombre a la base de datos para que sea más facil de usar 
"ENNDD_2018" <- X1_Composici_n_y_estructura_de_la_poblaci_n
remove(X1_Composici_n_y_estructura_de_la_poblaci_n) #quitamos la base de datos original para que no ocupe espacio en el ambiente

ENNDD_2018 |>
  janitor::clean_names()

"ENNDD_2018" <- ENNDD_2018 |>
  janitor::clean_names()   #Limpiamos los nombres para que sean más fáciles de usar 

#Vamos a ver un resumen de la base de datos

ENNDD_2018 |> #Este es un pipe nativo, nos permite pedir pasos para procesar instrucciones
  dplyr::glimpse()
 #Vamos a ver las primeras seis líneas
head(ENNDD_2018)

 #nos muestra todas las variables y sus nombres 
names(ENNDD_2018)

ENNDD_2018 |> 
  dplyr::select(entidad_federativa, poblacion_total) %>% #seleccionamos dos variables y le pedimos las primeras seis líneas
  head()

#TABULADOS Y GRÁFICOS (´,,•ω•,,)♡ ----
ENNDD_2018 |>
  dplyr::select(entidad_federativa, poblacion_total) %>% 
  tibble() %>% 
  print(n=33) #Así le hacemos para que nos salgan todas las entidades federaivas

"Tabla de Población Total" <- ENNDD_2018 |>
  dplyr::select(entidad_federativa, poblacion_total) %>% #Aquí el pipe indica que es un paso del procedimiento
  tibble() %>% 
  print(n=33) #El último paso no lleva pipe 

#Hagamos una tabla por sexo y entidad federativa
ENNDD_2018 |>
  dplyr::select(entidad_federativa, hombres, mujeres) %>% 
  tibble() %>% 
  print(n=33) 

#instalemos el paquete para hacer gráficos bonitos
install.packages("esquisse")
library(esquisse)
library(ggplot2)

ENNDD_2018 %>% #Este es el código que resulta de elaborar los gráficos en el add-in
  filter(id >= 2L & id <= 33L) %>%
  ggplot() +
  aes(
    x = entidad_federativa,
    y = relacion_hombres_mujeres_hombres_mujeres1
  ) +
  geom_col(fill = "#5D0CBF") +
  labs(
    x = "Entidad Federativa",
    y = "Relación Hombres-Mujeres",
    title = "RELACIÓN DE HOMBRES-MUJERES POR ENTIDAD FEDERATIVA",
    subtitle = "Encuesta Nacional de la Dinámica Demográfica 2018",
    caption = "Fuente: INEGI 2018 "
  ) +
  coord_flip() +
  theme_linedraw() +
  theme(plot.title = element_text(face = "bold", hjust = 0.5))

"grafico_1" <- ENNDD_2018 %>%
  filter(id >= 2L & id <= 33L) %>%
  ggplot() +
  aes(
    x = entidad_federativa,
    y = relacion_hombres_mujeres_hombres_mujeres1
  ) +
  geom_col(fill = "#5D0CBF") +
  labs(
    x = "Entidad Federativa",
    y = "Relación Hombres-Mujeres",
    title = "RELACIÓN DE HOMBRES-MUJERES POR ENTIDAD FEDERATIVA",
    subtitle = "Encuesta Nacional de la Dinámica Demográfica 2018",
    caption = "Fuente: INEGI 2018 "
  ) +
  coord_flip() +
  theme_linedraw() +
  theme(plot.title = element_text(face = "bold", hjust = 0.5))

grafico_1 #Para ver nuestro gráfico

#FIN!!!! ------
