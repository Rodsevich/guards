import 'package:guard_example/app/app.dart';
import 'package:guard_example/bootstrap.dart';

void main() {
  bootstrap(() => const App());
}

//!TODO(Lucas): hacer el siguiente esquema de rutas:

// home
//   |- /sacar-foto (guardas de camara y de login)
//   |- /login
//   |- /permisos/camara
//   |- /permisos/geolocalizacion

// QUIERO: home -> sacar foto
// PERO ME LLEVA A home -> login (xq la guarda de login esta arriba q la de camara, entonces la privilegia)
// le di login y el sistema pretende volver a sacar foto pero tampoco tengo camara, entonces me lleva a camara:
// home -> [sacar foto] -> camara
// le doy permiso entonces me lleva a sacar foto
// home -> sacar foto
// vuelvo a home
// vuelvo a sacar foto
// home -> sacar foto (esta vez no falla ninguna guarda y puedo sacar la foto bien)


// plan de accion:
// - mejorar ejemplo
// - crear guardas y delegates en paquete
// - dejar ejemplo mejorado andando
// - meter paqute desde path: en repo
// - hacer andar guarda de login y camara en repo exitosamente
// - pushear cambios en MR (PR)
// - hablar con Nico