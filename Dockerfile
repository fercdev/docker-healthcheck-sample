FROM node:18-alpine

RUN apk add --no-cache curl

WORKDIR /app

COPY index.js package.json ./

RUN npm ci --only=production || npm i --production

EXPOSE 3000

HEALTHCHECK --interval=15s --timeout=5s --start-period=5s --retries=3 CMD curl -fS http://localhost:3000/healthy || exit 1

# interval = frecuencia de chequeo
# timeout = cuanto debe de esperar en la respuesta 
# start-period = margen inicial antes del primer chequeo 
# retries = cantidad de intentos fallidos antes de marcarlo como unhealthy 

# -fS --> "f" hace referencia al fail silently (toma en cuenta el codigo de error de fallo), mas no el html 
#     --> "S" hace referencia a show error, mostrar el error si falla 

CMD [ "node", "index.js" ]