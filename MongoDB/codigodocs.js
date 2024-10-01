db.viagens.insertMany([
    {
        "_id": ObjectId("64fe8ef776c29e18275d9ed1"),
        "user_id": ObjectId("64fe8ef776c29e18275d9ed2"),
        "country": {
            "name": "Italy",
            "code": "IT",
            "continent": "Europe",
            "languages": ["Italian"],
            "currency": "EUR"
        },
        "cities": [
            {
                "name": "Rome",
                "population": 2873000,
                "is_capital": true,
                "rating": 4.8,
                "sightseeing": [
                    {
                        "name": "Colosseum",
                        "description": "An ancient amphitheater in Rome.",
                        "type": "Historic Site",
                        "entry_fee": 16
                    },
                    {
                        "name": "Vatican Museums",
                        "description": "Art museums within Vatican City.",
                        "type": "Museum",
                        "entry_fee": 17
                    }
                ]
            },
            {
                "name": "Venice",
                "population": 261321,
                "is_capital": false,
                "rating": 4.5,
                "sightseeing": [
                    {
                        "name": "St. Mark's Basilica",
                        "description": "Cathedral church of the Roman Catholic Archdiocese of Venice.",
                        "type": "Church",
                        "entry_fee": 5
                    },
                    {
                        "name": "Rialto Bridge",
                        "description": "The oldest of the four bridges spanning the Grand Canal in Venice.",
                        "type": "Bridge",
                        "entry_fee": 0
                    }
                ]
            },
            {
                "name": "Florence",
                "population": 382258,
                "is_capital": false,
                "rating": 4.7,
                "sightseeing": [
                    {
                        "name": "Uffizi Gallery",
                        "description": "A prominent art museum located adjacent to the Piazza della Signoria.",
                        "type": "Museum",
                        "entry_fee": 20
                    },
                    {
                        "name": "Ponte Vecchio",
                        "description": "A medieval stone closed-spandrel segmental arch bridge over the Arno River.",
                        "type": "Bridge",
                        "entry_fee": 0
                    }
                ]
            }
        ]
    },
    {
        "_id": ObjectId("64fe8ef776c29e18275d9ed3"),
        "user_id": ObjectId("64fe8ef776c29e18275d9ed4"),
        "country": {
            "name": "Japan",
            "code": "JP",
            "continent": "Asia",
            "languages": ["Japanese"],
            "currency": "JPY"
        },
        "cities": [
            {
                "name": "Tokyo",
                "population": 13929000,
                "is_capital": true,
                "rating": 4.9,
                "sightseeing": [
                    {
                        "name": "Tokyo Tower",
                        "description": "A communications and observation tower located in the Shiba-koen district.",
                        "type": "Landmark",
                        "entry_fee": 10
                    },
                    {
                        "name": "Meiji Shrine",
                        "description": "A Shinto shrine dedicated to Emperor Meiji and Empress Shoken.",
                        "type": "Shrine",
                        "entry_fee": 0
                    }
                ]
            },
            {
                "name": "Kyoto",
                "population": 1474570,
                "is_capital": false,
                "rating": 4.8,
                "sightseeing": [
                    {
                        "name": "Fushimi Inari-taisha",
                        "description": "A Shinto shrine famous for its thousands of red torii gates.",
                        "type": "Shrine",
                        "entry_fee": 0
                    },
                    {
                        "name": "Kiyomizu-dera",
                        "description": "A historic Buddhist temple known for its wooden stage and cherry blossoms.",
                        "type": "Temple",
                        "entry_fee": 4
                    }
                ]
            },
            {
                "name": "Osaka",
                "population": 8839469,
                "is_capital": false,
                "rating": 4.6,
                "sightseeing": [
                    {
                        "name": "Osaka Castle",
                        "description": "A Japanese castle with a rich history, surrounded by a moat and park.",
                        "type": "Castle",
                        "entry_fee": 6
                    },
                    {
                        "name": "Universal Studios Japan",
                        "description": "A popular theme park with rides and attractions based on movies.",
                        "type": "Theme Park",
                        "entry_fee": 75
                    }
                ]
            }
        ]
    },
    {
        "_id": ObjectId("64fe8ef776c29e18275d9ed5"),
        "user_id": ObjectId("64fe8ef776c29e18275d9ed6"),
        "country": {
            "name": "Brazil",
            "code": "BR",
            "continent": "South America",
            "languages": ["Portuguese"],
            "currency": "BRL"
        },
        "cities": [
            {
                "name": "Rio de Janeiro",
                "population": 6748000,
                "is_capital": false,
                "rating": 4.7,
                "sightseeing": [
                    {
                        "name": "Christ the Redeemer",
                        "description": "A giant statue of Jesus Christ atop the Corcovado mountain.",
                        "type": "Landmark",
                        "entry_fee": 24
                    },
                    {
                        "name": "Sugarloaf Mountain",
                        "description": "A peak situated at the mouth of Guanabara Bay, offering panoramic views.",
                        "type": "Mountain",
                        "entry_fee": 22
                    }
                ]
            },
            {
                "name": "São Paulo",
                "population": 12300000,
                "is_capital": false,
                "rating": 4.5,
                "sightseeing": [
                    {
                        "name": "São Paulo Museum of Art (MASP)",
                        "description": "A renowned art museum with an extensive collection of Western art.",
                        "type": "Museum",
                        "entry_fee": 20
                    },
                    {
                        "name": "Ibirapuera Park",
                        "description": "A major urban park in São Paulo with various cultural attractions.",
                        "type": "Park",
                        "entry_fee": 0
                    }
                ]
            },
            {
                "name": "Recife",
                "population": 1653461,
                "is_capital": false,
                "rating": 4.6,
                "sightseeing": [
                    {
                        "name": "Instituto Ricardo Brennand",
                        "description": "A cultural institute with a vast collection of art, weapons, and historical artifacts.",
                        "type": "Museum",
                        "entry_fee": 30
                    },
                    {
                        "name": "Boa Viagem Beach",
                        "description": "A famous beach with crystal-clear waters and white sand.",
                        "type": "Beach",
                        "entry_fee": 0
                    }
                ]
            }
        ]
    }
]);