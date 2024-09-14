
#!/usr/bin/env bash

# Establecemos el directorio actual del script
HERE=$(dirname $(readlink -f $0))

# Variables por defecto, que se pueden sobrescribir al ejecutar el script
SCREEN_SIZE=${SCREEN_SIZE:-800x600}
XDISPLAY=${XDISPLAY:-:1}
LOG_LEVEL=${LOG_LEVEL:-INFO}
APP=${APP:-$(python -c "from libqtile.utils import guess_terminal; print(guess_terminal())")}

# Verificamos si la variable PYTHON está definida, si no, utilizamos python3
if [[ -z $PYTHON ]]; then
    PYTHON=python3
fi

# Ejecutamos Xephyr en segundo plano
Xephyr +extension RANDR -screen ${SCREEN_SIZE} ${XDISPLAY} -ac &
XEPHYR_PID=$!

(
  # Pausa breve para permitir que Xephyr inicie correctamente
  sleep 1

  # Iniciar Qtile en el entorno de Xephyr con el nivel de logs y el display configurado
  env DISPLAY=${XDISPLAY} QTILE_XEPHYR=1 ${PYTHON} /usr/bin/qtile start -l ${LOG_LEVEL} -c ".~/.config/qtile/config.py" $@ &
  QTILE_PID=$!

  # Iniciar la aplicación de terminal detectada
  env DISPLAY=${XDISPLAY} ${APP} &

  # Esperamos a que termine Qtile
  wait $QTILE_PID

  # Matamos el proceso de Xephyr al terminar
  kill $XEPHYR_PID
)

