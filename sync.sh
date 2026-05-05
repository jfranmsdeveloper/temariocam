#!/bin/bash

# Script para sincronizar fácilmente los cambios con GitHub

# Comprobar si se ha pasado un mensaje de commit como argumento
if [ -z "$1" ]; then
    echo "⚠️  Por favor, proporciona un mensaje descriptivo para el commit."
    echo "Ejemplo de uso: ./sync.sh \"feat: actualizar estilos del modal\""
    exit 1
fi

echo "📦 Preparando archivos modificados..."
git add .

echo "📝 Creando commit con el mensaje: '$1'..."
git commit -m "$1"

echo "🚀 Subiendo los cambios al repositorio remoto..."
git push

# Comprobar si el push fue exitoso
if [ $? -eq 0 ]; then
    echo "✅ ¡Cambios sincronizados correctamente en GitHub!"
else
    echo "❌ Hubo un error al intentar subir los cambios. Revisa tu conexión o el estado del repositorio."
fi
