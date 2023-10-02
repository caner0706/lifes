import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_cinsiyet.dart';
import 'my_container.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  late String seciliCinsiyet = "";
  double icilenSigara = 0.0;
  double sporGunu = 0.0;
  int boy = 160;
  double kilo = 50.0;

  double hesaplaYasamSuresi(String cinsiyet, double sigara, double spor, int boy, double kilo) {
    double bazYasamSuresi = 80.0; // Ortalama yaşam süresi
    double sigaraEtkisi = sigara * 0.1; // Sigara içmek yaşam süresini azaltır (örneğin her sigara 0.1 yıl azaltır)
    double sporEtkisi = spor * 0.05; // Düzenli spor yaşam süresini artırır (örneğin her gün spor 0.05 yıl artırır)

    // Cinsiyete göre yaşam süresi hesapla (örneğin kadınlarda biraz daha uzun olabilir)
    double cinsiyetEtkisi = (cinsiyet == 'KADIN') ? 2.0 : 0.0;

    // Boy ve kiloya göre yaşam süresi etkisi
    double boyKiloEtkisi = (boy - 160 + (kilo - 50) * 0.1) * 0.01;

    // Toplam yaşam süresini hesapla
    double toplamYasamSuresi = bazYasamSuresi + cinsiyetEtkisi + sporEtkisi - sigaraEtkisi + boyKiloEtkisi;

    return toplamYasamSuresi;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange[800],
        title: const Text(
          'YAŞAM BEKLENTİSİ',
          style: TextStyle(color: Colors.black54,fontSize: 25),
        ),
        centerTitle: true,
      ),
      /*
      * Colum içerisine child ile Expanded verilmiştir. Bu expanded içerisine arayüz tasarımı için elemanlar yerleştirilmiştir */
      body: Column(

        crossAxisAlignment: CrossAxisAlignment.stretch, // Ekranda yer alan expandedların ekranda yayıla bildiği kadar yayılması için tanımlanmıştır.
        children: [
          // Yaş ve Kilo
          Expanded(
            //Row Kullanılarak Yatayda Birden Fazla Expanded Kullanılmıştır.
            child: Row(
              children: [
                Expanded(
                  child: MyContainer(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "BOY",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Divider(
                          color: Colors.black26,
                          thickness: 2, // Çizgi kalınlığı
                          height: 20, // Çizginin yüksekliği
                          indent: 20, // Sol kenardan boşluk
                          endIndent: 20, // Sağ kenardan boşluk
                        ),
                        Text(
                          boy.toString(),
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            OutlinedButton(
                              onPressed: (){
                                setState(() {
                                  boy++;
                                });
                              },
                              style: OutlinedButton.styleFrom(
                                side: BorderSide(color: Colors.lightBlue), // Burada borderSide'i style içerisinde tanımlıyoruz.
                              ),
                              child: Icon(FontAwesomeIcons.plus,size: 20,),
                            ),
                            SizedBox(width: 10), // İki buton arasında 10 birimlik bir boşluk
                            OutlinedButton(
                              onPressed: (){
                                setState(() {
                                  boy--;
                                });
                              },
                              style: OutlinedButton.styleFrom(
                              side: BorderSide(color: Colors.lightBlue), // Burada borderSide'i style içerisinde tanımlıyoruz.
                            ),
                              child: Icon(FontAwesomeIcons.minus,size: 20,),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: MyContainer(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "KİLO",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Divider(
                          color: Colors.black26,
                          thickness: 2, // Çizgi kalınlığı
                          height: 20, // Çizginin yüksekliği
                          indent: 20, // Sol kenardan boşluk
                          endIndent: 20, // Sağ kenardan boşluk
                        ),
                        Text(
                          kilo.toString(),
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            OutlinedButton(
                              onPressed: (){
                                setState(() {
                                  kilo = kilo + 0.5;
                                });
                              },
                              style: OutlinedButton.styleFrom(
                                side: BorderSide(color: Colors.lightBlue), // Burada borderSide'i style içerisinde tanımlıyoruz.
                              ),
                              child: Icon(FontAwesomeIcons.plus,size: 20,),
                            ),
                            SizedBox(width: 10), // İki buton arasında 10 birimlik bir boşluk
                            OutlinedButton(
                              onPressed: (){
                                setState(() {
                                  kilo = kilo - 0.5;
                                });
                              },
                              style: OutlinedButton.styleFrom(
                                side: BorderSide(color: Colors.lightBlue), // Burada borderSide'i style içerisinde tanımlıyoruz.
                              ),
                              child: Icon(FontAwesomeIcons.minus,size: 20,),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          //Orta Ekran 1. Slider
          Expanded(
            child: MyContainer(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Haftada Kaç Gün Spor Yapıyorsunuz?",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    sporGunu.round().toString(),
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Slider(
                      min: 0,
                      max: 7,
                      divisions: 7,
                      value: sporGunu,
                      onChanged: (double newValue){
                        setState(() {
                          sporGunu = newValue;
                        });
                      }
                  )
                ],
              ),
            ),
          ),
          //Orta Ekran 2. Slider
          Expanded(
            child: MyContainer(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center, // Colum içersinde yer alan nesneleri ortalamak için kullanılmıştır.
                children: [
                  Text(
                    "Günde Kaç Sigara İçiyorsunuz ?",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    icilenSigara.round().toString(),
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Slider(
                      min: 0,
                      max: 60,
                      value: icilenSigara,
                      onChanged: (double newValue){
                        setState(() {
                          icilenSigara = newValue;
                        });
                      }
                  )
                ],
              ),
            ),
          ),
          //Cinsiyet
          Expanded(
            //Row Kullanılarak Yatayda Birden Fazla Expanded Kullanılmıştır.
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        seciliCinsiyet = "KADIN";
                      });
                    },
                    child: MyContainer(
                      renk: seciliCinsiyet == "KADIN" ? Colors.lightBlue[100]! : Colors.white,
                      child: IconCinsiyet(cinsiyet: "KADIN", icon: FontAwesomeIcons.venus,),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        seciliCinsiyet = "ERKEK";
                      });
                    },
                    child: MyContainer(
                      renk: seciliCinsiyet == "ERKEK" ? Colors.lightBlue[100]! : Colors.white,
                      child: IconCinsiyet(cinsiyet: "ERKEK", icon: FontAwesomeIcons.mars,),
                    ),
                  ),
                ),
              ],
            ),
          ),
          //Hesaplama Butonu
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: 150, // Yatayda boyutunu ayarlayabilirsiniz
              child: ElevatedButton(
                onPressed: () {
                  // Beklenen yaşam süresi hesapla
                  double beklenenYasamSuresi = hesaplaYasamSuresi(seciliCinsiyet, icilenSigara, sporGunu, boy, kilo);

                  // Dialog'u göster
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Beklenen Yaşam Süresi'),
                        content: Text('Beklenen yaşam süresi: ${beklenenYasamSuresi.toStringAsFixed(2)} yıl'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('Kapat'),
                          ),
                        ],
                      );
                    },
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.white, // Butonun arkaplan rengi
                  onPrimary: Colors.black, // Buton metin rengi
                ),
                child: Text(
                  "Hesapla",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold, // Kalın yazı
                  ),
                ),
              ),
            ),
          )




        ],
      ),
    );
  }
}




