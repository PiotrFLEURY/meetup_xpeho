import 'package:flutter/material.dart';

Image logo() =>
    Image.network("https://xpeho.fr/wp-content/uploads/2016/03/XPEHO_logo.png");

Image banner() => Image.network(
      "https://xpeho.fr/wp-content/uploads/2016/03/xpehobkg.png",
      fit: BoxFit.cover,
    );
