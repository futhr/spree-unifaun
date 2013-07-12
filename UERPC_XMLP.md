# Unifaun ERPConnect - XMLPosting

This document is intended for providers of web-based business software and describes the integration method XML Posting with Unifaun Online.

___2013-04-17___

- Overview
  - Unifaun ERPConnect via Online Connect
  - Unifaun ERPConnect via XMLPosting
- User management
- Using Unifaun Online Business System
  - In the ERP system
  - In Unifaun Online
- Create order file
  - Examples of the order file
- Post order file to Unifaun Online
- Log in Unifaun Online
  - Implementation

## Overview

Unifaun Online is an online service for printing shipping labels, management of electronic data transfer (EDI) and monitoring of shipping services.

Shipping documents are produced using Unifaun Online follows the carrier's actual specifications.

Depending on the carrier and mode of transport may shipping documents contain various elements, such as barcodes serder-/kolli-id, customer number, service dispatch and recipient information, delivery and route codes. If the route code or delivery point shall be Unifaun Online can automatically look up the best of this information is not provided by the ERP system.

Although mailing lists and customs documents can be printed as needed. Correct shipping documents allows transport buyer will not have any additional charges from the carrier and facilitates all stages of the supply chain. Unifaun responsible for updating the layouts when carriers change in their specifications.

EDI follow the respective transport current specification. Advance EDI normally sent shortly after the printing of shipping document (unless shipping date is set in the future).

The format is often a carrier-specific variant of IFTMIN (Shipping Information).

Sending pre-EDI is often required by carriers to not surcharges are added to the shipping cost.

Unifaun also responsible here to update the format of EDI when carriers change in their specifications.

Monitoring done broadcasting can be done by the carrier sending the EDI back to Unifaun Online detailing the status changes for each consignment eg if the package is on the way or handed to the recipient.Depending on the carrier and service, this can be seen in Unifaun Online's broadcasting history. From history, even a detailed package increase allowed with the carrier providing the service.

Unifaun Online is carrier neutral and works the same way for all the carriers that are supported by the system (taking into account the differences in the various carriers services).

To use Unifaun Online, there must be an agreement with Unifaun and agreements with and account number of the current conveyors.

### Unifaun ERPConnect via Online Connect

ERPConnect via software Unifaun Online Connect is an additional function to Unifaun Online as Unifaun provides for an additional fee. This enables a direct connection between a company's business and Unifaun Online. Users can enter orders in the ERP system and get shipping labels printed and EDI sent without using Unifaun Online's user interface.

To use Unifaun ERPConnect to Unifaun Online requires, in addition to an agreement with Unifaun associated with a user identity in Unifaun Online, the ERP system can create approved order files as well as a Java-based application from Unifaun installed and used to mail order files to Unifaun Online. For printing frakthandlingar needed an installed Java-based application from Unifaun.

More information is available on [www.unifaun.com](www.unifaun.com).

For users of Web-based business applications, however the software to Unifaun ERPConnect be difficult to utilize in practice.

### Unifaun ERPConnect via XMLPosting

ERPConnect via XMLPosting called a service Unifaun introduces an opportunity for users of Web-based ERP order to post files directly to Unifaun Online. It is not intended to be used directly by the end user without the ERP vendor for technical integration with Unifaun Online, so that their customers in turn, benefit Unifaun ERPConnect.

The prerequisite for using the method XMLPosting is that the ERP system is operated, developed and adapted by the ERP vendor on behalf of the end user / customer. In this case the order files created and posted by the ERP system so that customers do not have to install and use Unifaun client software to mail order files. Otherwise the same conditions as for the software. For printing shipping document still requires the Windows-based client software from Unifaun.

Business software provider requires an agreement with Unifaun for using XMLPosting and each end user requires a license of Unifaun ERPConnect to benefit from integration.

Figure 1 Simplified diagram of Unifaun Online's function

**Implementation Points of ERP provider**

- Able to save user ID, password, and any profile in the business system for the users who will utilize Unifaun Online's services. See Sec. 3.
- Create an order file in XML format according to Chap. 5 of carriers, transport services and additional services that are current.
- Be able to post this order file to Unifaun Online under Sec. 6.
- Letting users log in Unifaun Online, via either [www.unifaun.com](www.unifaun.com) or directly via a URL under Sec 7.

**Features for users**

- The user creates order in the ERP system.
- Hard copies of shipping documents made in Unifaun Online.
- Monitoring is done in Unifaun Online.

## User management

All users of the ERP system designed to send shipments by Unifaun Online must be registered users of Unifaun Online.This means that they have an active user ID and password. A user ID normally consists of 10 to 16 characters (maximum 50 characters) and a password normally 4 to 6 characters (maximum 50 characters). Both of these are provided and administered by Unifaun and can not be changed by the user directly. As a registered user identity is tied to this one (or more) number at current carriers, which in turn will be charged the shipping services are announced through Unifaun Online.

Some clients with complex transport flows, in addition to user identity and password also have one or more profiles associated with the user identity which, when given at login. Profile name, with its associated password, determined in these cases by the customer and can be a maximum of 50 characters long. Profiles used in Unifaun Online to give different users different rights, and the separation order data, sender, recipient directory, broadcasting history, etc., and requires the customer signed an agreement Unifaun Online Plus.

The ERP system needs to store a user ID and password for those users who want to be able to mail order files to Unifaun Online.Where appropriate, one or more profile names and their passwords need to be stored in connection with the user's identity. In order files to be mailed to Unifaun Online business system must send the correct user ID and password. Shall direct links from the ERP system to Unifaun Online used also needed this user ID and password, and any profile.

It may be appropriate to logging events in the ERP system in order to detect any problems.

Security around and management of user identity, password and profile is of course important to ensure system integrity and prevent incorrect charges.

A Unifaun Online user ID must also have an agreement with Unifaun ERP Connect to receive the mailed order files. This agreement between the end user and Unifaun.

Business software provider needs to implement the following process to deploy new or existing customers in Unifaun Online:

1. Account in Unifaun Online. If customers are not yet a customer of Unifaun and therefore do not have a user identity in Unifaun Online, customers can arrange this via Unifaun support.

2. User ID, Password, and Profile. Allow customers to enter their Unifaun Online user identity, password, and any profile in the business system and store it appropriately in the ERP system so that they can be used by the ERP system when creating order files and to log in Unifaun Online.

3. Order Unifaun ERPConnect. Ask the customer to obtain a license by Unifaun ERPConnect tied to user identity in Unifaun Online. This can be done by contacting Unifaun Support. Please send a message to Unifaun that a customer will order Unifaun ERPConnect. Attach customer använderidentet if equipped. Then Unifaun announce ERP software provider in order coupling is activated and ready for operation.

4. Send Test files. For the first customers, or about new features or freight services to be used, it is important to send test files to Unifaun before the customer is in full operation. ERP Vendor own user identity in Unifaun Online can be used for testing. Contact Unifaun before the tests are done.

The ordinary process for connecting users of Unifaun ERPConnect includes testing and acceptance of order file. If XMLPosting used, make this step of the ERP vendor and need not be repeated in retail. Tests also are not required for each new customer, but only when the shrills new functionality.

Visit [www.unifaun.com](www.unifaun.com) for contact details and more information on orders.

Business software supplier is responsible for order files mailed to Unifaun Online is correct and contains information in accordance with the terms of current carriers freight services. Business software provider is also responsible for the connection between orders data and Unifaun Online User's identity is correct.

## 4 Using Unifaun Online Business System

Users of web-based business software needs Unifaun Online if they send pallets, parcels or certain types of letters. The interaction between the ERP system and Unifaun Online simplified by XMLPosting. The method allows the ERP system to send the necessary information to print shipping labels, EDI interchange and monitoring of shipments directly to Unifaun Online and so avoid doing the same work in two systems.

The following is a simplified description of the user process in the ERP, respectively.

### In the ERP system

- The user registers an order in the ERP system, indicates how and with which carrier the order must be shipped.

- Tasks such as recipient information, transport, any additional services, weight, number of packages, content and reference, must be attached to the order. Depending on the situation, the ERP system will automatically add certain tasks, such as content, weight and the reference without the user having to specify them. The ERP system must not provide the required data. The user can complete retrospective in Unifaun Online's user interface.

- After registration of the order creating the business system an order file under Unifaun specification. Sender can be included in its entirety in order file or placing in advance in Unifaun Online and only referenced in the order file.

- The ERP system mail order file to Unifaun Online.

- The user can log in Unifaun Online via either [www.unifaun.com](www.unifaun.com) or by link from the ERP system.

### In Unifaun Online

- Order from the ERP system are stored in Unifaun Online ready for printing.

- Any adjustments or additions can be made in Unifaun Online's user interface, for example if the information from the ERP system does not contain all the required data.

- The user prints the shipping documents from Unifaun Online's user interface and EDI sent to the carrier automatically (where the carrier can receive EDI).

- Monitoring of all shipments made in the last 6 months (possibly less number of transmissions is large) can be made from Unifaun Online's user interface, incl. package increases of carriers and services where increase package supported.

- Occasional shipments that are not registered by the ERP system can be registered directly in Unifaun Online's user interface, and then printed out along with orders from the ERP system or the side.

- Printers and labels designed for use with Unifaun Online, is available from Unifaun Online.

- More detailed help on using Unifaun Online is available in Unifaun Online's user interface.

### Create order file

Orderfilsformatet is XML-based and follows the usual conventions for XML files as specified by [www.w3.org/XML](www.w3.org/XML). This means that modern tools for creating XML files can and should be used to reduce the risk of errors.

One advantage of XML is that the format allows for the continuous development and additions to the functionality of Unifaun Online without requiring immediate action by the ERP vendor.

**The ERP system will need:**

- Provide interface where the end user can specify the full address details incl. phone number and email address for notification of the services require. Carrier's product descriptions and product terms (provided by the carrier) shows what is required for each service. The ERP system normally store this in the customer register. Since the information is completed in Unifaun Online after it has been posted from the ERP system, some information may be omitted.

- Provide interface where the end user can enter complete information for the shipment incl. number of packages, contents and importance of the services that require it.Carrier product descriptions show that this what is required for each service. The ERP system normally store this in the command register. This information may not be complete as it can be completed in Unifaun Online after it has been posted from the ERP system.

- Storing codes for freight services and facilities in order to create the correct order files.

- Storing descriptions of freight services and facilities in plain text to display for the end user.

- Be able to create an order file in XML format, as specified below.

A orderfils structure:

- An order file follows the XML standard, [www.w3.org](www.w3.org). Modern, stable tools should always be used to create and read XML files to avoid problems with character encoding and format / syntax.

- The first line of the file is XML header with information about character encoding. Most commonly used in Sweden is ISO-8859-1 (Latin 1) and UTF-8. Always specify this information in the XML header and then use consistently throughout the file to the standard you set.

E.g.

```xml
<?xml version="1.0" encoding="ISO-8859-1"?>
```

- This is followed by a head-XML block `<unifaunonline>` containing a number of XML-block of type meta `<meta>`, `<SENDER>` sender, receiver `<receiver>` and broadcast `<shipment>`. There must be a meta-block, zero, one or more avsändarblock, zero, one or more receiver block and one or more of windows.

- Meta-book contains information about who created the order file and when the file was created. This is very important for troubleshooting and support.

- Senderblock contains information about the sender. `sndid` (Sender) in senderblock referenced from the transmission block "from" hold. Often the same senderblock for all the transmission blocks in the order file. If several senderblock's order file must sndid be unique for each block. Senderblock may also be delivered in the order file if it is prepared in Unifaun Online.

- The receiver includes information about the receiver. `rcvid` (reciver identity) referenced from the transmission block "to" hold. Most often creates a recipient by sending blocks. If multiple recipient blocks in an order file must `rcvid` be unique in the file. The receiver block can also be delivered in the order file if it is prepared in Unifaun Online through import of recipient register.

- Sending book represents a transmission from a sender to a receiver containing a delivery service, any additional services and information about the packages contained.

**Information for Support and Troubleshooting**

To Unifaun be able to help with any problems, it is essential that information about who created the order file and when it is created attached order file. This is done in the initial meta-block. Identity of the "original" tag should be User ID of the system that creates the order file and the User ID of the customer. See the following example.

### Examples of the order file

**Example Post**

- A shipment consisting of two parcels of books 2 and 3 kg. As identity used ERP system order number (928374 in this example).

- Shipping Service is Post Parcel Post, Code: P25.

- Additional services are COD, Code: COD of 450 USD to bank with an OCR as reference and SMS notification, Code: NOTSMS, to a mobile number.Cash on delivery means that the customer pays the amount in the extradition of the package and the Post put the money in the account with the specified reference. SMS notification means in connection with cash on delivery, to an SMS sent to the specified mobile number when the package arrived at the delivery point as well as a reminder of the package has been more than a certain number of days.

- The broadcast will also be pre-notified by e-mail, access code: enot. The eight message sent in connection with EDI sent to the Post.

- Sender has already organized in Unifaun Online (typical) with a quick search value 'AVS1' (for this example).

- Recipient information attached order file. As identity used ERP system ID number (81010 in this example).

**Please note:** To get a complete set of carriers services and shipping method codes contact Unifaun to get a test account in Unifaun Online where you get access to the codes under Help Code lists.

```xml
<?xml version = "1.0" encoding = "ISO-8859-1"?>
<unifaunonline>
  <meta>
    <val n="origin"> creator user id. on Behalf Of (User-id.) </option>
    <val n="created"> yyyy-MM-dd HH: mm </option>
    <!-- Created: when this file was created. Example: 2012-08-20 14:35 -->
  </meta>
  <receiver rcvid="81010">
    <!-- Tuner Formation. -->
    <!-- Rcvid referenced in shipment block "to" tag below. -->
    <!-- A receiver blocks can be reused in multiple shipment blocks. -->
    <!-- If multiple recipients, will be used in an order file, must rcvid -->
    <!-- Be unique for each recipient.Use example. customer number. -->
    <!-- All necessary information is sent with this -->
    <!-- Examples, but the information may also completely or partially -->
    <!-- Be saved in the recipient in Pacsoft Online. -->
    <!-- Rcvid represented then by snabbsökvärdet in the recipient. -->
    <val n="name"> Best Customer </option>
    <val n="address1"> Attn: Mats Ryding </option>
    <val n="address2"> Smedjegatan 5 </option>
    <val n="zipcode"> 411 13 </option>
    <val n="city"> Gothenburg </option>
    <val n="country"> GB </option>
    <val n="contact"> Mats Ryding </option>
    <val n="phone"> 031-110395 </option>
    <val n="fax"> 031-110399 </option>
    <val n="orgno"> 556677-8899 </option>
    <val n="doorcode"> 1234 </option>
    <val n="email"> mats.ryding @ bastakunden.se </option>
    <val n="sms"> 0799-110395 </option>
    <!--
    Depending on shipping service is some of the above information
    mandatory.View Post's terms of service for more
    Information
    Incomplete orders can be completed in Pacsoft Online
    user interface.
    -->
  </receiver>
  <shipment orderno="928374">
    <!-- Sending information. -->
    <!-- Any shipment blocks can be in an order file. -->
    <!-- Order number 928374 for this example. -->
    <val n="from"> AVS1 </option>
    <!-- Sender snabbsökvärde AVS1 for this example. -->
    <val n="to"> 81010 </option>
    <!-- Receiver snabbsökvärde 81,010 for this example. -->
    <val n="reference"> 9283740 </option>
    <service srvid="P25">
      <!--
      P25 = Post Parcel Post. For more codes see
      described on the following pages.
      -->
      <addon adnid="COD">
        <!--
        COD = Cash on Delivery. For more codes see
        described on the following pages.
        -->
        <val n="amount"> 450.00 </option>
        <val n="account"> 11111112 </option>
        <val n="accounttype"> bg </option>
        <val n="reference"> 9283740 </option>
        <val n="referencetype"> ocr </option>
        <!--
        Amount = amount in SEK.
        account = account the amount to be paid into.
        account type = account, bg = bank, pg = giro.
        reference = reference text.
        reference type = reference type, OCR = OCR txt = text.
        -->
      </addon>
      <addon adnid="NOTSMS">
        <!--
        NOTSMS = Notification via text message. For more codes
        see description in the following pages.
        -->
        <val n="misc"> 0799110395 </option>
      </addon>
    </service>
    <ufonline>
      <option optid="enot">
        <val n="message"> Your order is complete and the package on its way. </option>
        <val n="to"> mats.ryding @ bastakunden.se </option>
      </option>
    </ufonline>
    <container type="parcel">
      <val n="copies"> 1 </option>
      <val n="weight"> 2 </option>
      <val n="contents"> Books </option>
    </container>
    <container type="parcel">
      <val n="copies"> 1 </option>
      <val n="weight"> 3 </option>
      <val n="contents"> Books </option>
    </container>
  </shipment>
</unifaunonline>
```

**Please note:** All data in this example are fictitious and should not be used in a real scenario. Any resemblance to actual names or numbers are unintentional.

**Example Schenker**

- A shipment consisting of three packages fittings for a total of 21 kg. As the identity of the vial for the business system order number (32345-012 in this example).

- Shipping Service, Schenker Comfort, code (srvid): BCF.

- Additional services are COD, code (adnid): COD at 980 kronor bank and with an OCR reference and Notification, Code: NOT, for a contact person with a phone number. COD means that the customer pays the amount on delivery of the goods and Schenker put the money in the account with the specified reference. Notification means that the receiver (named contact) dialed by Schenker prior to delivery.

- The broadcast will also be pre-notified by e-mail, access code: enot. This message is sent when the EDI sent to Schenker.

- Sender attached order file with a snabbsökvärde "1" (for this example). The invention can also be structured as in Unifaun Online so that the sender need not attached order file.

- Recipient information attached order file. As identity used ERP system ID number (32345 in this example).

**Please note:** For a complete set of carriers services and shipping method codes, see the document _SUP-112-Services-en_.

```xml
<?xml version = "1.0" encoding = "ISO-8859-1"?>
<unifaunonline>
  <meta>
    <val n="origin"> creator user id. on Behalf Of (User-id.) </option>
    <val n="created"> yyyy-MM-dd HH: mm </option>
    <!-- Created: when this file was created. Example: 2008-08-20 14:35 -->
  </meta>
  <sender sndid="1">
    <!-- Sender. -->
    <!-- Sndid referenced in shipment block "from" tag below. -->
    <!-- A sender blocks are reusable in multiple shipment blocks. -->
    <!-- All necessary information is sent with this -->
    <!-- Examples, but the information may also completely or partially -->
    <!-- Be saved in avsändarregistret in Unifaun Online. -->
    <!-- Sndid represented then by snabbsökvärdet in avsändarregistret. -->
    <val n="name"> Unifaun AB </option>
    <val n="address1"> Kaserntorget 5 </option>
    <val n="address2"> 5 stairs </option>
    <val n="zipcode"> 411 18 </option>
    <val n="city"> Gothenburg </option>
    <val n="country"> GB </option>
    <val n="contact"> Staffan Isaksson </option>
    <val n="phone"> 031-7253500 </option>
    <val n="fax"> 031-7253599 </option>
    <val n="orgno"> 556688-9999 </option>
    <val n="doorcode"> 1234 </option>
    <val n="email"> staffan.isaksson @ unifaun.se </option>
    <val n="sms"> 0799-999999 </option>
    <!--
    Depending on shipping service is some of the information required above.
    View Post's Terms of Service for more information.
    Incomplete orders can be completed in Unifaun online before print.
    -->
  </sender>
  <receiver rcvid="32345">
    <!-- Tuner Formation. -->
    <!-- Rcvid referenced in shipment block "to" tag below. -->
    <!-- A receiver blocks can be reused in multiple shipment blocks. -->
    <!-- If multiple recipients, will be used in an order file, must rcvid -->
    <!-- Be unique for each recipient.Use example. customer number. -->
    <!-- All necessary information is sent with this -->
    <!-- Examples, but the information may also completely or partially -->
    <!-- Be saved in the recipient in Unifaun Online. -->
    <!-- Rcvid represented then by snabbsökvärdet in the recipient. -->
    <val n="name"> Best Customer </option>
    <val n="address1"> Attn: Mats Ryding </option>
    <val n="address2"> Smedjegatan 5 </option>
    <val n="zipcode"> 411 13 </option>
    <val n="city"> Gothenburg </option>
    <val n="country"> GB </option>
    <val n="contact"> Mats Ryding </option>
    <val n="phone"> 031-110395 </option>
    <val n="fax"> 031-110399 </option>
    <val n="orgno"> 556677-8899 </option>
    <val n="doorcode"> 1234 </option>
    <val n="email"> mats.ryding @ bastakunden.se </option>
    <val n="sms"> 0799-110395 </option>
    <!--
    Depending on shipping service is some of the above information
    mandatory.View Post's terms of service for more
    Information
    Incomplete orders can be completed in Unifaun Online
    user interface.
    -->
  </receiver>
  <shipment orderno="32345-012">
    <!-- Sending information. -->
    <!-- Any shipment blocks can be in an order file. -->
    <!-- Order number: 32345-012 for this example. -->
    <val n="from"> 1 </option>
    <!-- Sender snabbsökvärde; 1 for this example. -->
    <val n="to"> 32345 </option>
    <!-- Receiver snabbsökvärde; 32,345 for this example. -->
    <val n="reference"> 98981212 </option>
    <service srvid="BCF">
      <!--
      BCF = Schenker Comfort. For more codes see
      tables on the following pages.
      -->
      <addon adnid="COD">
        <!--
        COD = COD.For more codes see
        tables on the following pages.
        -->
        <val n="amount"> 980.00 </option>
        <val n="account"> 9019506 </option>
        <val n="accounttype"> pg </option>
        <val n="reference"> 989812128 </option>
        <val n="referencetype"> ocr </option>
        <!--
        Amount = amount in SEK.
        account = account the amount to be paid into.
        account type = account, bg = bank, pg = giro.
        reference = reference text.
        reference type = reference type, OCR = OCR txt = text.
        -->
      </addon>
      <addon adnid="NOT">
        <!--
        NOTE = Notification. For more codes
        see description in the following pages.
        -->
        <val n="reference"> Violeta Andersson and Mats Ryding </option>
        <val n="misc"> 031-110395 </option>
        <!--
        reference = contact.
        misc = number.
        -->
      </addon>
    </service>
    <ufonline>
      <option optid="enot">
        <val n="message"> Your order is complete and the package on its way. </option>
        <val n="to"> mats.ryding @ bastakunden.se </option>
      </option>
    </ufonline>
    <container type="parcel">
      <val n="copies"> 3 </option>
      <val n="weight"> 21 </option>
      <val n="contents"> Fixtures </option>
    </container>
  </shipment>
</unifaunonline>
```

**Please note:** All data in this example are fictitious and should not be used in a real scenario. Any resemblance to actual names or numbers are unintentional. Example of an order file in XML format, see the online system under Help> Help Page> Unifaun orders clutch.

## Post order file to Unifaun Online

When an order file is created, it shall be mailed to Unifaun Online for the user to print shipping labels.

The order file is sent via HTTPS to [https://www.unifaunonline.com/ufoweb/order](https://www.unifaunonline.com/ufoweb/order) via the POST method. Actual file is sent directly to the message. There is thus no packaging of the order file in a message of MIME type in the way a browser does the file upload.

On URL:n specify the following parameters:

- `session` parameter is set at the first call to "ufo_SE" and the subsequent call to the value that was returned
- `user` User ID for the user that the order to send in order
- `pin` Password for the user ID specified in the user
- `type` Format of order file. In this case always "xml"

```php
if(($f = fopen('orderfile.xml', 'r')) !== false)
{
  // Note! Please replace 'u' with your user id and password 'p' with yours.
  $c = curl_init();
  curl_setopt($c, CURLOPT_POST, true);
  curl_setopt($c, CURLOPT_HTTPHEADER, array('Content-Type: text/xml'));
  curl_setopt($c, CURLOPT_POSTFIELDS, fread($f, filesize('orderfile.xml')));
  curl_exec($c);
}
```

```ruby
Curl::Easy.perform("http://www.google.co.uk") do |curl|
  curl.headers["User-Agent"] = "myapp-0.0"
  curl.verbose = true
end
```

In response to the HTTPS call got an XML file in the following format:

```xml
<?xml version="1.0" encoding="ISO-8859-1"?>
<response>
  <val n="session"> ufo_SE_E9821F8B1134330EE4A2760588B_0 </option>
  <val n="status"> 201 </option>
  <val n="message"> Created </option>
</response>
```

This is an example of a successful transmission. If something goes wrong in the scanning or login so got a different status and a different message in the "message". Possible status codes:

- `403` (logon failure). Verify user identity, password, and the account to Unifaun Online is active and that the order coupling function is active.

- `500` (reading problems). Check order file which contains syntax errors.

The value "session" can be used as a value of the parameter session on subsequent uploads of orders for the same user identity. Note, however, that the session is tied to a particular login so if an order for another user identity shall be sent, the parameter session set back to "ufo_SE" again.

A package-id is not generated by Unifaun Online before shipping labels are printed. Therefore, these can not return report discounted to the ERP system. Kolli Identities are generally used to perform tracking of goods, but one can instead be done with the business system order number or reference. See Section 8 below.

**Please note:** This way of posting order files to Unifaun Online may change in the future to enable new functionality. Unifaun will notify such changes as early as possible before the changes take effect. You may need to modify the way to post files to Unifaun Online.

Approval of XMLPosting function

After you've created and posted the correct order file to you (or your client) the user id in the online system in contact Unifaun Support for an approval means that you can start using the feature for your customers. The approval process is controlled `<val n="origin">` and `<val n="created">` data in orderfilens `<meta>` section. These values are mandatory for XMLPosting. You can check the information under History> Word files in your online system.

## Log in Unifaun Online

For the user to print shipping labels must log in Unifaun Online happen.Either the normal way via www.unifaun.com or through the link generated by the ERP system.In some cases, the person who entered the order in the ERP system the same as printing shipping labels. In other cases, different persons care of these two data. The management should be planned Nations on these opportunities met.

Login Link from the ERP system to Unifaun Online generated as follows:

Base URL is [https://www.unifaunonline.com/webapp](https://www.unifaunonline.com/webapp)

As the parameters are always given:

    Env    = ufo_SE
    Action = act_SystemActions_AutoLogin

Then user identity, any profile and password as:

    Company = <user_id>
    User    = <profilename>
    Pass    = <password>

`<user_id>` exchanged for the client user identity in Unifaun Online, `<profilename>` exchanged for the potential profile and `<password>` changed to customer's password.

### Homepage

The following URL logs the user on Unifaun Online's web site;

```html
https://www.unifaunonline.com/webapp?Env=ufo_SE&Action=act_SystemActions_AutoLogin&Company=<user_id>&User=<profilnamn>&Pass=<password>
```

After the order has been posted to Unifaun Online are those orders in Unifaun Online's stored jobs. Additional parameters can be attached URL: n so that the user ends up there right away:

    Menu = Printing
    Body = act_MenuActions_Item_ItemHandler_ShipmentJobSearchActions

### Stored Printing

The following URL logs in the user lands on Unifaun Online's page for Stored Printing;

```html
https://www.unifaunonline.com/webapp?Env=ufo_SE&Action=act_SystemActions_AutoLogin&Company=<user_id>&User=<profilnamn>&Pass=<password>&Menu=Printing&Body=act_MenuActions_Item_ItemHandler_ShipmentJobSearchActions
```

**Please note:** This way to log in Unifaun Online is provisional and will be changed.Unifaun will announce such a change as early as possible in nan change takes effect.You then need to modify the creation of the URL of the login.

## Unifaun Track &amp; Trace

Unifaun Track &amp; Trace allows you to track your shipments in the same manner regardless of carrier. You also get detailed information about the shipment. You do not keep track of the carriers' shipping or tracking information because you use your own order number or order reference as search parameter.

Unifaun Track &amp; Trace is designed to integrate with your ERP system.When a transmission is printed or stored in Unifaun Online, or submitted directly from your business, keep Unifaun Track &amp; Trace out the broadcast from within your ERP system.
This feature is available only for Unifaun Online Plus account and must be activated via Unifaun Support.

Please contact Unifaun Support at +46 31 725 35 50 (weekdays 8:00 to 17:00) or by email support@unifaun.com.

**Please note:** Unifaun Track &amp; Trace applies only to carriers and transport where tracking feature appears online.

### Implementation

After Unifaun Track &amp; Trace is enabled, tracking is performed via an internet URL where you can use either the order number or reference that search parameter.

Search by reference:

```html
https://www.unifaunonline.com/ext.uo.se.track?key=<user_id>&reference=<your_referens>
```

- Replace `<user_id>` against your own Unifaun Online user identity.
- Replace `<your_referens>` against reference information for the shipment.

Ex 1:

```html
https://www.unifaunonline.com/ext.uo.se.track?key=DEMO&reference=786523
```

Search on order number:

```html
https://www.unifaunonline.com/ext.uo.se.track?key=<user_id>&order=<your_password> <ordernmmer>
```

- Replace `<user_id>` against your Unifaun Online user identity.
- Replace `<your_password>` `<ordernummer>` the broadcast order number.

Ex 2:

```html
https://www.unifaunonline.com/ext.uo.se.track?key=USER_ID&order=45345
```
