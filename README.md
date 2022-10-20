# movieApp
"DEVELOP" -> branch o rama que está el demo (pueden probar, clonar o descargar desde "develop")

Este es una demo en repositorio para que puedan ver un listado de películas, tendencia, lanzamientos, ver su detalle y su trailer de cada película. Se hace uso de una api TheMovieDb (está en el código). Además esta demo está separada por capas y cada capa tiene responsabilidades única. Se usa patrón arquitéctonico MVP-Routing-Configuration y como gestor de dependencia Cocoapods (por favor abrir con el archivo de extensión .xcworkspace).

Respuestas a preguntas:
1. Cada capa o clase de la aplicación debe tener una responsabilidad propia en sí. Por ejemplo: Tienes una capa para la llamada a servicio pero no puedes poner lógica de negocio o navegación entre pantallas o vistas en el mismo archivo ya que violas el primer principio de Solid. Por eso es Responsabilidad única: Es responsable de algo específico.
2. La aplicación debe ser fácil de leer, de entender, debe ser testeable, refactorizable, debe estar por capas, debe tener patrones de diseño, ordenado, etc. Ahí podemos decir que es código limpio.
3. Lo hice con animaciones nativas pero del mismo UINavigationController y UIViewController. Igual cumplí con lo indicado de animaciones, pero hubiera implementado el CoreAnimation.
