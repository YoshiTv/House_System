YD = {}

YD.MinimalKey = 1

YD.Craft = {
    Name = 'ox:option1',
    Event = 'compra:chiavi',
    Icon = 'fa-solid fa-key',
    Ped = 's_m_y_construct_01',
    PosPed = vector4(475.6599, -1290.6504, 28.5388, 356.2273),
    BlipCoords = vector4(475.6175, -1290.6123, 29.5395, 1.6632),
    BlipSprite = 402,
    BlipScale = 0.8,
    BlipColour = 1,
    BlipName = "Fabbricazione Chiavi"
}

YD.CraftMenu = {
    Title = 'SHOP CHIAVI',
    TitlePopolari = 'Chiavi Case Popolari',
    TitleModerne = 'Chiavi Case Moderne',
    ItemRemove = 'money',
    KeyPopolare = 'casapopolare',
    AmountPopolare = 500,
    KeyModerna = 'casamoderna',
    AmountModerna = 1500,
    ProgPos = 'middle',
    ProgWait = 8500
}

YD.Popolare = {
    BlipCoords = vector4(287.9904, -1095.0790, 29.4196, 269.0790),
    BlipSprite = 40,
    BlipScale = 0.6,
    BlipColour = 0,
    BlipName = "Case Popolari",
    TargetEntrata = {
        Event = "entrata",
        Icon = "fa-solid fa-door-open",
    },
    ProgWait = 2500,
    CoordsHouse = vector3(266.1327, -1007.38, -101.0),
    Guardaroba = {
        Name = 'guardarobapopular',
        Coords = vector3(260.0826, -1003.3162, -99.0086),
        Type = 2,
        Show3D = false,
        Color = { r = 255, g = 133, b = 60},
        Distance = 38.0,
        Control = 'E'
    },
    Frigo = {
        Event = "frigo",
        Icon = "fa-solid fa-basket-shopping",
        ShopName = 'CasePopolari'
    },
    Deposito = {
        Event = "depositopopolare",
        Icon = "fa-solid fa-vault",
        NameInv = 'popolare'
    },
    Uscita = {
        Name = "USCITA",
        Event = "esci:casa",
        Icon = "fas fa-door-open",
        Label = "Esci Dalla Casa",
        ServerEvent = 'uscita:casa',
        PosUscita = vector3(289.5234, -1095.0813, 29.4196),
        ProgWait = 2500,
    }
}

YD.Moderna = {
    BlipCoords = vector4(-287.6204, -1061.4871, 27.2054, 67.8188),
    BlipSprite = 475,
    BlipScale = 0.6,
    BlipColour = 0,
    BlipName = "Case Moderne",
    Entrata = {
        Event = "entmoderna",
        Icon = "fa-solid fa-door-open",
        Label = "Entra Nella Casa Moderna",
        CoordsEnter = vector3(-603.0526, 58.9724, 98.2002)
    },
    ProgWait = 2500,
    Position = 'middle',
    Guardaroba = {
        Name = 'guardarobamoderna',
        Coords = vector3(-594.6561, 55.6760, 96.9996),
        Type = 2,
        Show3D = false,
        Color = { r = 255, g = 133, b = 60},
        Distance = 38.0,
        Control = 'E'
    },
    Frigo = {
        Event = "frigomoderna",
        Icon = "fa-solid fa-basket-shopping",
        ShopName = 'CasePopolari',
    },
    Deposito = {
        Event = "depositomederna",
        Icon = "fa-solid fa-vault",
        NameInv = 'moderna'
    },
    EsciCasa = {
        Event = "esci:casamoderna",
        Icon = "fas fa-door-open",
        CoordsEsc = vector3(-285.8247, -1061.9684, 27.2054),
    }
}

YD.Lang = {
    ProgLabel = "Attendendo Fabbricazione Chiavi",
    TargetShop = 'Compra Chiavi',
    Popolare = "Hai Ricevuto Le Chiavi Della Tua Casa Popolare",
    EnterHouse = "Sei entrato dentro alla tua Casa",
    TargetHousePopolare = "Entra Nella Casa Popolare",
    ProgEnter = 'Entrando In Casa',
    ErrorEnter = "Non hai le chiavi della Casa Popolare",
    ErrorModern = 'Non hai le chiavi della Casa Moderna',
    Moderna = "Hai ricevuto le chiavi della tua Casa Moderna",
    Error = "Non hai abbastanza soldi",
    LabelEscHouse = "Uscendo Dalla Casa",
    Frigo = "Apri Frigo",
    Guardaroba = 'Cambiarti Vestiti',
    Deposito = "Apri Deposito",
    MsgEscHouse = "Esci Dalla Casa"
}