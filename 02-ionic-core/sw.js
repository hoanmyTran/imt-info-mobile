const STATIC_CACHE_NAME = 'my-sw-cache';

const FILES_TO_CACHE = [
    '/',
    'app.css',
    'app.js'
]

self.addEventListener('install', event => {
    // only happens once for this version of the service worker
    // wait until the install event has resolved

    event.waitUntil(
        Promise.all([
            caches.open(STATIC_CACHE_NAME)
            .then(cache => {
                return cache.addAll(FILES_TO_CACHE);
            })
        ])
    )
})

self.addEventListener('fetch', event => {
    console.log('Fetching: ', event.request.url);
    // If the request in GET, let the network handle things,
    if (event.request.method !== 'GET') {
        return;
    }
    // here we block the request and handle it ourselves
    event.respondWith(
        caches
            .match(event.request).then(response => {
                if (response) {
                    // Our response is in the cache, let's return that instead
                    console.log(event.request.url, 'servi depuis le cache');
                    return response;
                }
                // else, let's fetch it
                console.log(event.request.url, 'servi depuis le réseau');
                return fetch(event.request)
                    .then(response => {
                        // We have a response from the network
                        return response;
                    }).catch(error => {
                        console.error('Fetching failed: ', error);
                        throw error;
                    });
            })
    )
})