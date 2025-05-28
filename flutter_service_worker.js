'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {".git/COMMIT_EDITMSG": "b026324c6904b2a9cb4b88d6d61c81d1",
".git/config": "b4c6ed6e4efd11b4fa29ab0940b3eaff",
".git/description": "a0a7c3fff21f2aea3cfa1d0316dd816c",
".git/HEAD": "5ab7a4355e4c959b0c5c008f202f51ec",
".git/hooks/applypatch-msg.sample": "ce562e08d8098926a3862fc6e7905199",
".git/hooks/commit-msg.sample": "579a3c1e12a1e74a98169175fb913012",
".git/hooks/fsmonitor-watchman.sample": "a0b2633a2c8e97501610bd3f73da66fc",
".git/hooks/post-update.sample": "2b7ea5cee3c49ff53d41e00785eb974c",
".git/hooks/pre-applypatch.sample": "054f9ffb8bfe04a599751cc757226dda",
".git/hooks/pre-commit.sample": "5029bfab85b1c39281aa9697379ea444",
".git/hooks/pre-merge-commit.sample": "39cb268e2a85d436b9eb6f47614c3cbc",
".git/hooks/pre-push.sample": "2c642152299a94e05ea26eae11993b13",
".git/hooks/pre-rebase.sample": "56e45f2bcbc8226d2b4200f7c46371bf",
".git/hooks/pre-receive.sample": "2ad18ec82c20af7b5926ed9cea6aeedd",
".git/hooks/prepare-commit-msg.sample": "2b5c047bdb474555e1787db32b2d2fc5",
".git/hooks/push-to-checkout.sample": "c7ab00c7784efeadad3ae9b228d4b4db",
".git/hooks/sendemail-validate.sample": "4d67df3a8d5c98cb8565c07e42be0b04",
".git/hooks/update.sample": "647ae13c682f7827c22f5fc08a03674e",
".git/index": "5e8ba13c856d8fb14da6d5bc13afb315",
".git/info/exclude": "036208b4a1ab4a235d75c181e685e5a3",
".git/logs/HEAD": "471c1d89b355f2e1d561e050107de8ea",
".git/logs/refs/heads/gh-pages": "471c1d89b355f2e1d561e050107de8ea",
".git/logs/refs/remotes/origin/gh-pages": "a94ef73d8dfb57b367b01c22ac2a0741",
".git/objects/03/2fe904174b32b7135766696dd37e9a95c1b4fd": "80ba3eb567ab1b2327a13096a62dd17e",
".git/objects/07/963e1c7f1a601b2604694d3031f519036633f5": "18f57aba40bafba5b92e6435f58014a1",
".git/objects/0e/97b785659d4d6c85dcf2b72904c992feb40bdc": "625d3591a7721a1d5376f2d3c3f54268",
".git/objects/0e/aae67318df12538917c70e0375914156e13338": "b158eead36ac6aeaa5aab941cbc11d20",
".git/objects/13/faf591e11b65142fee91e2c5c104efee218270": "7b2b9f0b67168ef6edc08207ce9fb8ca",
".git/objects/1a/5e3cc7924a645dc45610d3bef877c5541198a0": "340dfa196870e43b5111e054e4c5301e",
".git/objects/1c/cdfd34edbf1d0debb763a96601395eae575661": "28cc2668187349adab3289d5ad44aa3b",
".git/objects/30/d1cfbccb6c61405c0a249d049db39f73ccd705": "9f7e3c1cfd8b3574af0c3f5b89a1a9b1",
".git/objects/33/31d9290f04df89cea3fb794306a371fcca1cd9": "e54527b2478950463abbc6b22442144e",
".git/objects/35/96d08a5b8c249a9ff1eb36682aee2a23e61bac": "e931dda039902c600d4ba7d954ff090f",
".git/objects/37/b5e26dda2ef66b5477faed59d150a72d08572e": "43c9823521e421560f01565ce3eacc4b",
".git/objects/39/3c15ed0117e1b65a07945390d3815ceba0413b": "c90a0c613a6ab6ba2230f5b93435b524",
".git/objects/3c/b9c07cd0b9cf2a6a19f0116adbd6555511b8b5": "9b768c398e8e6e8e9e5bf454fb1ddc1e",
".git/objects/40/1184f2840fcfb39ffde5f2f82fe5957c37d6fa": "1ea653b99fd29cd15fcc068857a1dbb2",
".git/objects/44/04d380ae12e4e7ac92aac1212718491e899e24": "9f7216054340ebd06f90a95deccc45fe",
".git/objects/46/4ab5882a2234c39b1a4dbad5feba0954478155": "2e52a767dc04391de7b4d0beb32e7fc4",
".git/objects/48/98e297a96884b5b3c438e9210c3bbb5010f245": "cbc876a7baad681a504f13f255f1ade8",
".git/objects/4c/44a5afc8941ad1c14434256930b3f6408f1b9c": "da766a97393a2d90a1acda7c8645abf1",
".git/objects/4f/02e9875cb698379e68a23ba5d25625e0e2e4bc": "254bc336602c9480c293f5f1c64bb4c7",
".git/objects/57/4cf79f9a959cde3598bf0a34d9b8d583e6ff5f": "b6865adec1ecd1debd587651177ef318",
".git/objects/57/7946daf6467a3f0a883583abfb8f1e57c86b54": "846aff8094feabe0db132052fd10f62a",
".git/objects/5e/b3a4e2e6f1096f0764a1a5c46fd12a787cec2e": "e0ae897246e2214712a16a9de59de397",
".git/objects/5f/bf1f5ee49ba64ffa8e24e19c0231e22add1631": "f19d414bb2afb15ab9eb762fd11311d6",
".git/objects/62/8c7113f7ea83051cb7998b3ae39a5149d1c006": "86d28ba6a9d8bfffc32d1b7fa0965286",
".git/objects/64/5116c20530a7bd227658a3c51e004a3f0aefab": "f10b5403684ce7848d8165b3d1d5bbbe",
".git/objects/6b/9862a1351012dc0f337c9ee5067ed3dbfbb439": "85896cd5fba127825eb58df13dfac82b",
".git/objects/71/610d7d6ca044ffa6b767e4ee9eb42eb959a321": "1cea01f3e147e1c5c5fb118137de444b",
".git/objects/7e/f96d5e43f93217b1e3cde04040db962a0e0506": "9dadbaea68faf4b099b1d4cbcd131000",
".git/objects/81/512228709e9a7065ad98246f578874d12d2bad": "77d743f4f3e0c39e3b3a13cfa140fcd9",
".git/objects/88/cfd48dff1169879ba46840804b412fe02fefd6": "e42aaae6a4cbfbc9f6326f1fa9e3380c",
".git/objects/8a/51a9b155d31c44b148d7e287fc2872e0cafd42": "9f785032380d7569e69b3d17172f64e8",
".git/objects/8a/aa46ac1ae21512746f852a42ba87e4165dfdd1": "1d8820d345e38b30de033aa4b5a23e7b",
".git/objects/8c/ae41e7cfa6954bd77995e1d814a7e0d4a188c9": "4f3c137c6977f23b918a326e45961d3a",
".git/objects/91/4a40ccb508c126fa995820d01ea15c69bb95f7": "8963a99a625c47f6cd41ba314ebd2488",
".git/objects/93/be7fd9b9dcdd8564dafd7040a0c8c8f68d4080": "b27ff257c793a735fc818ff37f392ff9",
".git/objects/97/81251f640afd35a6f2fd1789d0f886011d5793": "1a1143270e9a140a56c12ba70a6a2117",
".git/objects/a2/bf62d84930af6ca53d653b3504c05d07aafa28": "668d06e85e87a1cccb0999e49a391342",
".git/objects/a5/de584f4d25ef8aace1c5a0c190c3b31639895b": "9fbbb0db1824af504c56e5d959e1cdff",
".git/objects/a6/aa4b3ab66e0408ff9950bea71835a370b27bbe": "00382f80a86ab0875060779d7b5e9d76",
".git/objects/a8/8c9340e408fca6e68e2d6cd8363dccc2bd8642": "11e9d76ebfeb0c92c8dff256819c0796",
".git/objects/ab/b2d92c9502603970f08eed362ff5336cc7daa1": "079e590bd80052e726cf8a791896ee62",
".git/objects/b1/e25090bc3eeb4600c03ed4f1285b7060eeda22": "b55c350934179e17653fd16aee67a4b2",
".git/objects/b7/49bfef07473333cf1dd31e9eed89862a5d52aa": "36b4020dca303986cad10924774fb5dc",
".git/objects/b9/2a0d854da9a8f73216c4a0ef07a0f0a44e4373": "f62d1eb7f51165e2a6d2ef1921f976f3",
".git/objects/b9/e8931bf36098d28e25e7235cdbb61ca1e9b69d": "2428eb0a02245f62b95281ebe4894f88",
".git/objects/bb/48804c7b4e369ce0b8076ba5d43fb6a951a159": "9437d3043723ae406cb6a80b02a3f13d",
".git/objects/cc/7ed85c756030404e33bd05476f2a834af1a4d4": "222d00cb79a1ee9b455e315bfb7fbce3",
".git/objects/d4/3532a2348cc9c26053ddb5802f0e5d4b8abc05": "3dad9b209346b1723bb2cc68e7e42a44",
".git/objects/d6/9c56691fbdb0b7efa65097c7cc1edac12a6d3e": "868ce37a3a78b0606713733248a2f579",
".git/objects/d7/7cfefdbe249b8bf90ce8244ed8fc1732fe8f73": "9c0876641083076714600718b0dab097",
".git/objects/d9/3952e90f26e65356f31c60fc394efb26313167": "1401847c6f090e48e83740a00be1c303",
".git/objects/dc/29742e6e57633a1cf5235bf5fa136c4f5b7e9f": "d065bfb5d8a10c0a0313c1711fb3bd7e",
".git/objects/de/44cfabd006e425f968febb889e26c5f5c36ba8": "0229d541733793b37420cbbb58518cf6",
".git/objects/df/1467d7908e401f2fbc665f981d53cef2106b5d": "e0a6bbfa759bac5c121c7d5dd61c1459",
".git/objects/e0/b7ad6f6be9db0c17c7ccef48b926a963117f6f": "6f5c2c211aa96249317929f9e9cd1190",
".git/objects/e0/c5770ab4f11b623793cedffb0adb1c18ee27fc": "770cac9624f98d842481a7647a3f9402",
".git/objects/e8/5f71bcb5e0ea883a094987cceead54c89a26d6": "a424ab6f1a173d74fcc8a5f1cbb8b77a",
".git/objects/e9/94225c71c957162e2dcc06abe8295e482f93a2": "2eed33506ed70a5848a0b06f5b754f2c",
".git/objects/eb/9b4d76e525556d5d89141648c724331630325d": "37c0954235cbe27c4d93e74fe9a578ef",
".git/objects/ef/b875788e4094f6091d9caa43e35c77640aaf21": "27e32738aea45acd66b98d36fc9fc9e0",
".git/objects/f2/04823a42f2d890f945f70d88b8e2d921c6ae26": "6b47f314ffc35cf6a1ced3208ecc857d",
".git/objects/f3/634e5cc99f4f31b5a3835940387010dec5e236": "33713ca571afc7df16db5f9594637728",
".git/objects/f3/709a83aedf1f03d6e04459831b12355a9b9ef1": "538d2edfa707ca92ed0b867d6c3903d1",
".git/objects/f5/72b90ef57ee79b82dd846c6871359a7cb10404": "e68f5265f0bb82d792ff536dcb99d803",
".git/objects/f6/9f20141f46f884e698c40f9ea8d7b476f024f7": "b234387eea1d78883bbb71c7761d3999",
".git/objects/fc/9099215767bc7b714e383dd10a8e572c4d1ae1": "e74a0c939b69e0d0c69004c4051c76fd",
".git/objects/fe/705fd7c3dbe0716dc14c923eacccb301356132": "92174f5fd0b738c1bb0eb015bb5a5122",
".git/refs/heads/gh-pages": "66f5eb93fc51fa1782a20ec3721c9314",
".git/refs/remotes/origin/gh-pages": "66f5eb93fc51fa1782a20ec3721c9314",
"assets/AssetManifest.bin": "0213780613ee92777a35fd80094ea6c8",
"assets/AssetManifest.bin.json": "874f44c42a00cdcab54e1ab486974f45",
"assets/AssetManifest.json": "b193943381c434a1e3f1402095137493",
"assets/assets/icons/apk_icon.png": "9e267e46a30310c3539588eb8806d70a",
"assets/assets/icons/appstore_icon.png": "038d999cf19d1d733fbd137c6d750d87",
"assets/assets/icons/chat_icon.png": "c8c5514bee5ac5bf6f2a632cf44b28c3",
"assets/assets/icons/feedback_avatar1.png": "064b7478de6123479ed6756bdc48df5b",
"assets/assets/icons/feedback_avatar2.png": "4545476251c6bd6194b1fb6372ac28b8",
"assets/assets/icons/feedback_avatar3.png": "f6c7ce594e1d85d332649bfafbc72f5e",
"assets/assets/icons/game_icon.png": "9f593f5441e8568081a1c66c149dd24e",
"assets/assets/icons/google_play.png": "0cd2801d043d7e19b2eddf354d9bee88",
"assets/assets/icons/music_icon.png": "706e0634ab52c063c0c59ce471a055cc",
"assets/assets/icons/star.png": "d2ba538bda6685831847603cafa6ed9b",
"assets/assets/icons/video_icon.png": "984d6ff9678a27f0a78f8153152cdcc5",
"assets/assets/images/qr_lumicare.png": "999d20f083be1e05376b134265c68b90",
"assets/assets/images/qr_lumitel.png": "c09548baed068d28339cba6ae240397e",
"assets/assets/images/services_img.png": "8d56cdf93aed786f7deca700e55c21a3",
"assets/assets/images/slider1.png": "b1ad2ea55d724ecf4f7b431aece7427a",
"assets/assets/images/slider1_img.png": "c2152b60b3191ce20a05106c8976e733",
"assets/assets/images/slider2.png": "e8f099cb8ed8972c7e150b4099bda7fb",
"assets/assets/images/slider2_img.png": "18e76c5b4fd5865857dbc4f1c2922018",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "799d9d28917ba9abf8cf85fcf56e5ac7",
"assets/NOTICES": "bb04fe0bf4b7ea38cf4a0f8757795adc",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "86e461cf471c1640fd2b461ece4589df",
"canvaskit/canvaskit.js.symbols": "68eb703b9a609baef8ee0e413b442f33",
"canvaskit/canvaskit.wasm": "efeeba7dcc952dae57870d4df3111fad",
"canvaskit/chromium/canvaskit.js": "34beda9f39eb7d992d46125ca868dc61",
"canvaskit/chromium/canvaskit.js.symbols": "5a23598a2a8efd18ec3b60de5d28af8f",
"canvaskit/chromium/canvaskit.wasm": "64a386c87532ae52ae041d18a32a3635",
"canvaskit/skwasm.js": "f2ad9363618c5f62e813740099a80e63",
"canvaskit/skwasm.js.symbols": "80806576fa1056b43dd6d0b445b4b6f7",
"canvaskit/skwasm.wasm": "f0dfd99007f989368db17c9abeed5a49",
"canvaskit/skwasm_st.js": "d1326ceef381ad382ab492ba5d96f04d",
"canvaskit/skwasm_st.js.symbols": "c7e7aac7cd8b612defd62b43e3050bdd",
"canvaskit/skwasm_st.wasm": "56c3973560dfcbf28ce47cebe40f3206",
"favicon.ico": "f1de9cf619b1017d38cb1911d2bd453d",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"favicon1.ico": "c425653ebd9dbc2687968f92d2c4f0d8",
"flutter.js": "76f08d47ff9f5715220992f993002504",
"flutter_bootstrap.js": "8757af25d245d51d0898128cca9ad38f",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "6a62bb21f33e27e0075ded968c30509a",
"/": "6a62bb21f33e27e0075ded968c30509a",
"main.dart.js": "5007b0d807b69bf78a6d9b63c9e11567",
"manifest.json": "71e0154c18320c9ca4cbf26c3e30935d",
"version.json": "322dfa94430cc69aa45ce83495f46466"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
