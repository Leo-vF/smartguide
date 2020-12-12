import 'package:flutter/material.dart';

class PrivacyPolicy extends StatefulWidget {
  PrivacyPolicy(this.lang);
  final bool lang;

  @override
  _PrivacyPolicyState createState() => _PrivacyPolicyState(lang);
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  _PrivacyPolicyState(this.lang);
  final bool lang;
  String title;

  @override
  void initState() {
    title = lang ? "Datenschutzerklärung" : "Privacy Policy";
    super.initState();
  }

  Widget german(BuildContext context) {
    return SingleChildScrollView(
      child: Text(
        "Das Staatliche Gymnasium Holzkirchen hat die Smartguide Holzkirchen App als Open Source App entwickelt. Dieser SERVICE wird vom Staatlichen Gymnasium Holzkirchen kostenlos zur Verfügung gestellt und ist für die Nutzung ohne Einschränkung gedacht.\n\nDiese Seite dient dazu, Besucher über unsere Richtlinien bezüglich der Sammlung, Verwendung und Offenlegung von persönlichen Informationen zu informieren, falls sich jemand für die Nutzung unseres Dienstes entscheidet.\n\nWenn Sie sich entscheiden, unseren Service zu nutzen, stimmen Sie der Sammlung und Nutzung von Informationen in Bezug auf diese Richtlinie zu. Die von uns gesammelten persönlichen Informationen werden für die Bereitstellung und Verbesserung des Dienstes verwendet. Wir werden Ihre Informationen nicht verwenden oder weitergeben, außer wie in dieser Datenschutzerklärung beschrieben.\n\nSammlung und Verwendung von Informationen\n\nUm Ihnen die Nutzung unseres Dienstes zu erleichtern, bitten wir Sie unter Umständen, uns bestimmte personenbezogene Daten zur Verfügung zu stellen. Die von uns angeforderten Informationen werden von uns aufbewahrt und wie in dieser Datenschutzrichtlinie beschrieben verwendet.\n\nDie App nutzt Dienste von Drittanbietern, die möglicherweise Informationen sammeln, mit denen Sie identifiziert werden können.\n\nLink zu den Datenschutzrichtlinien von Drittanbietern, die von der App verwendet werden\n\n\tGoogle Play-Dienste\n\tMapbox\n\nLog-Daten\n\nWir möchten Sie darüber informieren, dass wir bei der Nutzung unseres Dienstes im Falle eines Fehlers in der App Daten und Informationen (durch Produkte von Drittanbietern) auf Ihrem Telefon sammeln, die sogenannten Logdaten. Diese Logdaten können Informationen wie die Internetprotokoll-Adresse („IP“) Ihres Geräts, den Gerätenamen, die Version des Betriebssystems, die Konfiguration der App bei der Nutzung unseres Dienstes, die Uhrzeit und das Datum Ihrer Nutzung des Dienstes und andere Statistiken enthalten.\n\nCookies\n\nCookies sind Dateien mit einer kleinen Menge an Daten, die üblicherweise als anonyme eindeutige Identifikatoren verwendet werden. Diese werden von den Websites, die Sie besuchen, an Ihren Browser gesendet und im internen Speicher Ihres Geräts gespeichert.\n\nDieser Dienst verwendet diese „Cookies“ nicht explizit. Die App kann jedoch Code und Bibliotheken von Drittanbietern verwenden, die „Cookies“ nutzen, um Informationen zu sammeln und ihre Dienste zu verbessern. Sie haben die Möglichkeit, diese Cookies entweder zu akzeptieren oder abzulehnen und zu wissen, wann ein Cookie an Ihr Gerät gesendet wird. Wenn Sie sich entscheiden, unsere Cookies abzulehnen, können Sie möglicherweise einige Teile dieses Dienstes nicht nutzen.\n\nDienstanbieter\n\nWir können aus den folgenden Gründen Drittunternehmen und Einzelpersonen einsetzen\n\n\tUm unseren Dienst zu ermöglichen;\n\nZur Bereitstellung des Dienstes in unserem Namen;\n\num dienstbezogene Dienstleistungen zu erbringen; oder\n\nUm uns bei der Analyse der Nutzung unseres Dienstes zu unterstützen.\n\nWir möchten die Nutzer dieses Dienstes darüber informieren, dass diese Dritten Zugriff auf Ihre persönlichen Daten haben. Der Grund dafür ist, dass sie die ihnen zugewiesenen Aufgaben in unserem Namen ausführen. Sie sind jedoch verpflichtet, die Informationen nicht für andere Zwecke weiterzugeben oder zu verwenden.\n\nSicherheit\n\nWir wissen Ihr Vertrauen zu schätzen, das Sie uns bei der Übermittlung Ihrer persönlichen Daten entgegenbringen, und bemühen uns daher, wirtschaftlich vertretbare Mittel zum Schutz dieser Daten einzusetzen. Denken Sie jedoch daran, dass keine Methode der Übertragung über das Internet oder der elektronischen Speicherung zu 100% sicher und zuverlässig ist, und wir können keine absolute Sicherheit garantieren.\n\nLinks zu anderen Seiten\n\nDieser Service kann Links zu anderen Sites enthalten. Wenn Sie auf einen Link eines Dritten klicken, werden Sie zu dieser Site weitergeleitet. Beachten Sie, dass diese externen Sites nicht von uns betrieben werden. Wir raten Ihnen daher dringend, die Datenschutzrichtlinien dieser Websites zu lesen. Wir haben keine Kontrolle über und übernehmen keine Verantwortung für den Inhalt, die Datenschutzrichtlinien oder die Praktiken von Websites oder Diensten Dritter.\n\nDatenschutz für Kinder\n\nDiese Dienste richten sich nicht an Personen unter 13 Jahren. Wir sammeln nicht wissentlich persönlich identifizierbare Informationen von Kindern unter 13 Jahren. Sollten wir feststellen, dass ein Kind unter 13 Jahren uns persönliche Daten zur Verfügung gestellt hat, löschen wir diese sofort von unseren Servern. Wenn Sie ein Elternteil oder ein Erziehungsberechtigter sind und Sie wissen, dass Ihr Kind uns persönliche Daten zur Verfügung gestellt hat, kontaktieren Sie uns bitte, damit wir die notwendigen Maßnahmen ergreifen können.\n\nÄnderungen an dieser Datenschutzrichtlinie\n\nWir können unsere Datenschutzrichtlinie von Zeit zu Zeit aktualisieren. Wir empfehlen Ihnen daher, diese Seite regelmäßig auf Änderungen zu überprüfen. Wir werden Sie über alle Änderungen informieren, indem wir die neue Datenschutzrichtlinie auf dieser Seite veröffentlichen.\n\nDiese Richtlinie ist gültig ab dem 2020-12-08\n\nKontaktieren Sie uns\n\nWenn Sie Fragen oder Anregungen zu unserer Datenschutzrichtlinie haben, zögern Sie nicht, uns unter smartguide-holzkirchen@protonmail.com zu kontaktieren.\n\nDiese Seite mit Datenschutzrichtlinien wurde auf privacypolicytemplate.net erstellt und von App Privacy Policy Generator modifiziert/generiert",
        style: TextStyle(fontSize: 16.0),
      ),
    );
  }

  Widget english(BuildContext context) {
    return SingleChildScrollView(
      child: Text(
        "Staatliches Gymnasium Holzkirchen built the Smartguide Holzkirchen app as an Open Source app. This SERVICE is provided by Staatliches Gymnasium Holzkirchen at no cost and is intended for use as is.\n\nThis page is used to inform visitors regarding our policies with the collection, use, and disclosure of Personal Information if anyone decided to use our Service.\n\nIf you choose to use our Service, then you agree to the collection and use of information in relation to this policy. The Personal Information that we collect is used for providing and improving the Service. We will not use or share your information with anyone except as described in this Privacy Policy.\n\nInformation Collection and Use\n\nFor a better experience, while using our Service, we may require you to provide us with certain personally identifiable information. The information that we request will be retained by us and used as described in this privacy policy.\n\nThe app does use third party services that may collect information used to identify you.\n\nLink to privacy policy of third party service providers used by the app\n\n\tGoogle Play Services\n\tMapbox\n\nLog Data\n\nWe want to inform you that whenever you use our Service, in a case of an error in the app we collect data and information (through third party products) on your phone called Log Data. This Log Data may include information such as your device Internet Protocol (“IP”) address, device name, operating system version, the configuration of the app when utilizing our Service, the time and date of your use of the Service, and other statistics.\n\nCookies\n\nCookies are files with a small amount of data that are commonly used as anonymous unique identifiers. These are sent to your browser from the websites that you visit and are stored on your device's internal memory.\n\nThis Service does not use these “cookies” explicitly. However, the app may use third party code and libraries that use “cookies” to collect information and improve their services. You have the option to either accept or refuse these cookies and know when a cookie is being sent to your device. If you choose to refuse our cookies, you may not be able to use some portions of this Service.\n\nService Providers\n\nWe may employ third-party companies and individuals due to the following reasons:\n\n\tTo facilitate our Service;\n\tTo provide the Service on our behalf;\n\tTo perform Service-related services; or\n\tTo assist us in analyzing how our Service is used.\n\nWe want to inform users of this Service that these third parties have access to your Personal Information. The reason is to perform the tasks assigned to them on our behalf. However, they are obligated not to disclose or use the information for any other purpose.\n\nSecurity\n\nWe value your trust in providing us your Personal Information, thus we are striving to use commercially acceptable means of protecting it. But remember that no method of transmission over the internet, or method of electronic storage is 100% secure and reliable, and we cannot guarantee its absolute security.\n\nLinks to Other Sites\n\nThis Service may contain links to other sites. If you click on a third-party link, you will be directed to that site. Note that these external sites are not operated by us. Therefore, we strongly advise you to review the Privacy Policy of these websites. We have no control over and assume no responsibility for the content, privacy policies, or practices of any third-party sites or services.\n\nChildren’s Privacy\n\nThese Services do not address anyone under the age of 13. We do not knowingly collect personally identifiable information from children under 13. In the case we discover that a child under 13 has provided us with personal information, we immediately delete this from our servers. If you are a parent or guardian and you are aware that your child has provided us with personal information, please contact us so that we will be able to do necessary actions.\n\nChanges to This Privacy Policy\n\nWe may update our Privacy Policy from time to time. Thus, you are advised to review this page periodically for any changes. We will notify you of any changes by posting the new Privacy Policy on this page.\n\nThis policy is effective as of 2020-12-08\n\nContact Us\n\nIf you have any questions or suggestions about our Privacy Policy, do not hesitate to contact us at smartguide-holzkirchen@protonmail.com.\n\nThis privacy policy page was created at privacypolicytemplate.net and modified/generated by App Privacy Policy Generator",
        style: TextStyle(fontSize: 16.0),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xffa0c510),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(title),
      ),
      body: SafeArea(
        child: lang ? german(context) : english(context),
      ),
    );
  }
}
