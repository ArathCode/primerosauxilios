//
//  FirstAidLibrary.swift
//  primerosauxilios
//
//  Contenido basado en recomendaciones generales de primeros auxilios
//  (Cruz Roja, American Heart Association). Revisar con un profesional
//  de la salud antes de publicar.
//

import UIKit

enum FirstAidLibrary {
    static let disclaimer = "Esta información es una guía general y no sustituye la capacitación formal en primeros auxilios ni la atención médica profesional. En una emergencia, llama al \(EmergencyCaller.number)."

    static let topics: [FirstAidTopic] = [
        // MARK: Emergencias vitales
        FirstAidTopic(
            id: "rcp",
            title: "RCP (Reanimación)",
            summary: "La persona no responde y no respira o solo jadea.",
            symbolName: "heart.fill",
            tint: .systemRed,
            category: .lifeThreatening,
            keywords: ["paro cardiaco", "reanimacion cardiopulmonar", "no respira", "inconsciente", "compresiones", "DEA", "desfibrilador"],
            steps: [
                "Verifica que el lugar sea seguro para ti y para la persona.",
                "Toca sus hombros y pregunta en voz alta: \"¿Está bien?\". Si no responde, grita pidiendo ayuda.",
                "Llama al 911 (o pide a alguien que llame) y que traigan un DEA (desfibrilador) si hay uno cerca. Pon el teléfono en altavoz.",
                "Observa si respira normalmente durante no más de 10 segundos. Los jadeos ocasionales NO son respiración normal.",
                "Si no respira, colócala boca arriba sobre una superficie firme.",
                "Pon el talón de una mano en el centro del pecho y la otra mano encima, entrelazando los dedos.",
                "Con los brazos rectos, comprime fuerte y rápido: unos 5 cm de profundidad, a un ritmo de 100 a 120 por minuto. Deja que el pecho regrese por completo entre compresiones.",
                "Si estás entrenado, da 2 respiraciones de rescate cada 30 compresiones. Si no, haz solo compresiones sin parar.",
                "En cuanto llegue el DEA, enciéndelo y sigue sus instrucciones de voz.",
                "Continúa hasta que la persona respire, llegue ayuda profesional o ya no puedas seguir.",
            ],
            tips: [
                "Un buen ritmo es el de la canción \"Stayin' Alive\" o \"La Macarena\".",
                "En niños, usa una o dos manos y comprime unos 5 cm. En bebés, usa dos dedos en el centro del pecho y comprime unos 4 cm.",
                "Si hay otra persona, túrnense cada 2 minutos para no perder fuerza.",
            ],
            donts: [
                "No interrumpas las compresiones por más de 10 segundos.",
                "No tengas miedo de lastimar: sin RCP las probabilidades de sobrevivir son muy bajas.",
                "No pierdas tiempo buscando el pulso si no estás entrenado.",
            ],
            callWhen: [
                "Siempre: llama de inmediato si la persona no responde o no respira normalmente.",
            ]
        ),
        FirstAidTopic(
            id: "atragantamiento",
            title: "Atragantamiento",
            summary: "No puede hablar, toser ni respirar por algo atorado en la garganta.",
            symbolName: "lungs.fill",
            tint: .systemOrange,
            category: .lifeThreatening,
            keywords: ["asfixia", "ahogo", "heimlich", "atorado", "obstruccion", "comida"],
            steps: [
                "Pregunta: \"¿Te estás atragantando?\". Si puede toser con fuerza o hablar, anímala a seguir tosiendo.",
                "Si no puede hablar, toser ni respirar, pide a alguien que llame al 911.",
                "Colócate detrás de la persona e inclínala ligeramente hacia adelante, sosteniendo su pecho con una mano.",
                "Da 5 golpes firmes en la espalda, entre los omóplatos, con el talón de la otra mano.",
                "Si el objeto no sale, da 5 compresiones abdominales (maniobra de Heimlich): rodea su cintura, coloca el puño justo encima del ombligo, cúbrelo con la otra mano y presiona con fuerza hacia adentro y hacia arriba.",
                "Alterna 5 golpes en la espalda y 5 compresiones abdominales hasta que expulse el objeto o pierda el conocimiento.",
                "Si pierde el conocimiento, recuéstala en el suelo, asegúrate de que alguien llamó al 911 e inicia RCP.",
            ],
            tips: [
                "En embarazadas o personas con obesidad, haz las compresiones en el centro del pecho en lugar del abdomen.",
                "En bebés menores de 1 año: 5 golpes en la espalda con el bebé boca abajo sobre tu antebrazo, luego 5 compresiones en el pecho con dos dedos. Nunca hagas compresiones abdominales a un bebé.",
                "Si estás solo y te atragantas, presiona tu abdomen contra el respaldo de una silla.",
            ],
            donts: [
                "No metas los dedos a ciegas en la boca para buscar el objeto.",
                "No des golpes en la espalda si la persona está tosiendo con fuerza.",
                "No le des agua ni comida para \"empujar\" el objeto.",
            ],
            callWhen: [
                "No puede respirar, hablar ni toser.",
                "Pierde el conocimiento.",
                "Después de una maniobra de Heimlich, para una revisión médica.",
            ]
        ),
        FirstAidTopic(
            id: "hemorragia",
            title: "Hemorragia grave",
            summary: "Sangrado abundante que no se detiene.",
            symbolName: "drop.fill",
            tint: .systemRed,
            category: .lifeThreatening,
            keywords: ["sangrado", "sangre", "herida profunda", "torniquete", "corte"],
            steps: [
                "Protégete: usa guantes o una barrera (por ejemplo, una bolsa de plástico) si es posible.",
                "Llama al 911 si el sangrado es abundante o no se detiene.",
                "Aplica presión directa y firme sobre la herida con una gasa, tela limpia o tu mano.",
                "Mantén la presión de forma continua, sin levantar para revisar, durante al menos 10 minutos.",
                "Si la sangre traspasa la tela, coloca más encima sin retirar la primera.",
                "Si el sangrado en un brazo o pierna no se controla con presión, coloca un torniquete 5 a 7 cm por encima de la herida, apriétalo hasta que deje de sangrar y anota la hora.",
                "Mantén a la persona acostada y abrigada mientras llega la ayuda.",
            ],
            donts: [
                "No retires objetos clavados en la herida; presiona alrededor de ellos.",
                "No aflojes ni retires un torniquete una vez colocado.",
                "No pongas café, tierra, polvos ni remedios caseros sobre la herida.",
            ],
            callWhen: [
                "La sangre sale a chorros o no se detiene tras 10 minutos de presión.",
                "La herida es profunda o está en el cuello, pecho o abdomen.",
                "Hay signos de shock: piel pálida y fría, confusión, respiración rápida o debilidad.",
            ]
        ),
        FirstAidTopic(
            id: "infarto",
            title: "Infarto (ataque al corazón)",
            summary: "Dolor u opresión en el pecho, falta de aire y sudor frío.",
            symbolName: "bolt.heart.fill",
            tint: .systemPink,
            category: .lifeThreatening,
            keywords: ["ataque cardiaco", "dolor de pecho", "corazon", "opresion", "aspirina"],
            steps: [
                "Reconoce los signos: dolor, presión u opresión en el pecho que puede extenderse al brazo, cuello, mandíbula o espalda; falta de aire, sudor frío, náuseas o mareo.",
                "Llama al 911 de inmediato.",
                "Ayuda a la persona a sentarse en una posición cómoda (semisentada) y afloja la ropa apretada.",
                "Si no es alérgica, no tiene problemas de sangrado y el operador del 911 no indica lo contrario, dale a masticar una aspirina para adultos.",
                "Mantenla en calma y en reposo. No la dejes sola.",
                "Si pierde el conocimiento y no respira normalmente, inicia RCP.",
            ],
            tips: [
                "En mujeres, adultos mayores y personas con diabetes los síntomas pueden ser menos claros: cansancio inusual, náuseas o dolor de espalda o mandíbula.",
                "Si la persona tiene nitroglicerina recetada, ayúdale a tomarla según su indicación.",
            ],
            donts: [
                "No esperes a ver si los síntomas desaparecen.",
                "No permitas que la persona maneje para ir al hospital.",
                "No le des comida ni bebida.",
            ],
            callWhen: [
                "Ante cualquier sospecha de infarto: cada minuto cuenta.",
            ]
        ),
        FirstAidTopic(
            id: "derrame",
            title: "Derrame cerebral (EVC)",
            summary: "Cara caída, brazo débil o dificultad repentina para hablar.",
            symbolName: "brain.head.profile",
            tint: .systemPurple,
            category: .lifeThreatening,
            keywords: ["embolia", "ictus", "evc", "avc", "accidente cerebrovascular", "paralisis", "habla"],
            steps: [
                "Cara: pídele que sonría. ¿Un lado de la cara está caído?",
                "Brazos: pídele que levante ambos brazos. ¿Uno se cae o no lo puede levantar?",
                "Habla: pídele que repita una frase sencilla. ¿Arrastra las palabras o no se le entiende?",
                "Tiempo: si notas cualquiera de estos signos, llama al 911 de inmediato.",
                "Anota la hora en que empezaron los síntomas (o la última vez que se le vio bien). Es vital para el tratamiento.",
                "Mantén a la persona en reposo, recostada con la cabeza y los hombros ligeramente elevados.",
                "Si vomita o está somnolienta, colócala en posición lateral de seguridad. Si deja de respirar, inicia RCP.",
            ],
            donts: [
                "No le des comida, bebida ni medicamentos (tampoco aspirina).",
                "No esperes a que los síntomas pasen, aunque mejoren.",
            ],
            callWhen: [
                "Ante cualquier signo de derrame, aunque dure solo unos minutos.",
            ]
        ),
        FirstAidTopic(
            id: "anafilaxia",
            title: "Reacción alérgica grave",
            summary: "Hinchazón de cara o garganta y dificultad para respirar tras un alérgeno.",
            symbolName: "allergens",
            tint: .systemTeal,
            category: .lifeThreatening,
            keywords: ["anafilaxia", "alergia", "epinefrina", "adrenalina", "epipen", "hinchazon", "ronchas"],
            steps: [
                "Llama al 911 de inmediato.",
                "Si la persona tiene un autoinyector de epinefrina (adrenalina), ayúdale a usarlo en la parte externa del muslo, incluso sobre la ropa.",
                "Acuéstala con las piernas elevadas. Si le cuesta respirar, déjala sentada.",
                "Si no mejora en 5 a 15 minutos y tiene una segunda dosis, aplícala.",
                "Vigila su respiración. Si deja de respirar, inicia RCP.",
            ],
            donts: [
                "No la pongas de pie ni la hagas caminar, aunque se sienta mejor.",
                "No esperes a ver si mejora sola.",
                "No le des nada por la boca si le cuesta respirar o tragar.",
            ],
            callWhen: [
                "Dificultad para respirar, silbidos o voz ronca.",
                "Hinchazón de labios, lengua, cara o garganta.",
                "Mareo, desmayo o piel pálida tras contacto con un alérgeno.",
            ]
        ),
        FirstAidTopic(
            id: "convulsiones",
            title: "Convulsiones",
            summary: "Movimientos involuntarios y pérdida del conocimiento.",
            symbolName: "waveform.path.ecg",
            tint: .systemIndigo,
            category: .lifeThreatening,
            keywords: ["epilepsia", "ataque", "temblores", "crisis convulsiva"],
            steps: [
                "Mantén la calma y mide cuánto dura la convulsión.",
                "Aleja objetos peligrosos y protege su cabeza con algo suave.",
                "Afloja la ropa ajustada alrededor del cuello.",
                "Cuando terminen los movimientos, colócala en posición lateral de seguridad para que pueda respirar.",
                "Quédate con ella hasta que esté completamente consciente y háblale con calma.",
            ],
            donts: [
                "No la sujetes ni intentes detener sus movimientos.",
                "No metas nada en su boca: no se va a tragar la lengua.",
                "No le des agua, comida ni medicamentos hasta que esté totalmente alerta.",
            ],
            callWhen: [
                "Dura más de 5 minutos o le da otra enseguida.",
                "Es su primera convulsión.",
                "No respira bien o no despierta después.",
                "Ocurrió en el agua, se lesionó, está embarazada o es diabética.",
            ]
        ),

        // MARK: Lesiones y otras situaciones
        FirstAidTopic(
            id: "quemaduras",
            title: "Quemaduras",
            summary: "Por fuego, líquidos calientes, químicos o electricidad.",
            symbolName: "flame.fill",
            tint: .systemOrange,
            category: .injuries,
            keywords: ["quemadura", "fuego", "ampolla", "escaldadura", "agua caliente", "aceite"],
            steps: [
                "Aleja a la persona de la fuente de calor. Si su ropa está en llamas: que se detenga, se tire al suelo y ruede.",
                "Enfría la quemadura con agua corriente fresca (no helada) durante 20 minutos.",
                "Retira anillos, relojes o ropa cerca de la zona antes de que se inflame, salvo que estén pegados a la piel.",
                "Cubre la quemadura con plástico autoadherente o una tela limpia que no suelte pelusa.",
                "Mantén a la persona abrigada, sobre todo si la quemadura es extensa.",
            ],
            donts: [
                "No uses hielo, pasta de dientes, mantequilla, aceite ni remedios caseros.",
                "No revientes las ampollas.",
                "No retires ropa pegada a la piel.",
            ],
            callWhen: [
                "La quemadura es más grande que la palma de la mano de la persona, o es profunda, blanca o negra.",
                "Está en cara, manos, pies, genitales o articulaciones.",
                "Es eléctrica o química, o la persona inhaló humo.",
                "La persona es un bebé, un niño pequeño o un adulto mayor.",
            ]
        ),
        FirstAidTopic(
            id: "fracturas",
            title: "Fracturas y esguinces",
            summary: "Dolor intenso, deformidad o incapacidad para mover una parte del cuerpo.",
            symbolName: "figure.fall",
            tint: .systemBlue,
            category: .injuries,
            keywords: ["hueso roto", "fractura", "esguince", "torcedura", "caida", "golpe", "ferula"],
            steps: [
                "No muevas a la persona salvo que esté en peligro inmediato, sobre todo si sospechas lesión en la cabeza, el cuello o la espalda.",
                "Si hay sangrado, presiona alrededor de la herida con una tela limpia.",
                "Inmoviliza la zona en la posición en que la encontraste, con una férula improvisada (cartón, revista enrollada) que abarque las articulaciones de arriba y abajo.",
                "Aplica frío (hielo envuelto en una tela) durante 15 a 20 minutos para reducir la hinchazón.",
                "Vigila signos de shock: palidez, piel fría y sudorosa, respiración rápida. Si aparecen, acuéstala y abrígala.",
            ],
            donts: [
                "No intentes enderezar ni acomodar el hueso.",
                "No apliques hielo directamente sobre la piel.",
                "No dejes que apoye o use la parte lesionada.",
            ],
            callWhen: [
                "El hueso está expuesto o hay una deformidad evidente.",
                "Sospechas lesión en la cabeza, cuello, espalda o cadera.",
                "La zona debajo de la lesión está fría, azulada o adormecida.",
            ]
        ),
        FirstAidTopic(
            id: "heridas",
            title: "Heridas y cortes",
            summary: "Cortes, raspones y heridas pequeñas.",
            symbolName: "bandage.fill",
            tint: .systemGreen,
            category: .injuries,
            keywords: ["corte", "raspon", "herida", "curita", "cortada", "infeccion"],
            steps: [
                "Lávate las manos o usa guantes.",
                "Detén el sangrado presionando con una gasa o tela limpia durante unos minutos.",
                "Lava la herida con agua limpia y jabón suave alrededor.",
                "Cubre con una gasa o curita limpia.",
                "Cambia el vendaje cada día o si se moja o ensucia.",
            ],
            donts: [
                "No soples sobre la herida.",
                "No uses alcohol, yodo ni agua oxigenada dentro de la herida: dañan el tejido.",
            ],
            callWhen: [
                "La herida es profunda, sus bordes no se juntan o no deja de sangrar.",
                "Fue causada por una mordedura o un objeto sucio u oxidado (puede necesitar vacuna antitetánica).",
                "Aparecen signos de infección: enrojecimiento que se extiende, calor, pus o fiebre.",
            ]
        ),
        FirstAidTopic(
            id: "desmayo",
            title: "Desmayo",
            summary: "Pérdida breve del conocimiento.",
            symbolName: "person.crop.circle.badge.exclamationmark",
            tint: .systemBlue,
            category: .injuries,
            keywords: ["desmayo", "desvanecimiento", "mareo", "sincope", "perdida de conocimiento"],
            steps: [
                "Si alguien siente que se va a desmayar, ayúdale a sentarse o acostarse.",
                "Si se desmaya, acuéstala boca arriba y eleva sus piernas unos 30 cm.",
                "Afloja la ropa ajustada y asegúrate de que tenga aire fresco.",
                "Comprueba que respira. Normalmente recupera el conocimiento en menos de un minuto.",
                "Cuando despierte, que permanezca acostada unos minutos y se levante despacio.",
            ],
            donts: [
                "No le des nada de beber hasta que esté totalmente consciente.",
                "No la levantes de golpe.",
            ],
            callWhen: [
                "No recupera el conocimiento en 1 o 2 minutos.",
                "No respira normalmente (inicia RCP).",
                "Tuvo dolor en el pecho, palpitaciones o convulsiones, o se golpeó la cabeza.",
                "Está embarazada o es un adulto mayor.",
            ]
        ),
        FirstAidTopic(
            id: "intoxicacion",
            title: "Intoxicación",
            summary: "Ingestión, inhalación o contacto con sustancias tóxicas.",
            symbolName: "cross.vial.fill",
            tint: .systemPurple,
            category: .injuries,
            keywords: ["envenenamiento", "veneno", "quimicos", "medicamentos", "cloro", "gas", "sobredosis"],
            steps: [
                "Asegúrate de que el lugar es seguro. Si hay humo, gas o vapores, ventila o aléjate.",
                "Identifica la sustancia, la cantidad y la hora. Guarda el envase.",
                "Llama al 911 o a un centro de información toxicológica y sigue sus indicaciones.",
                "Si la sustancia tocó la piel o los ojos, enjuaga con abundante agua corriente durante 15 a 20 minutos.",
                "Si está inconsciente pero respira, colócala en posición lateral de seguridad. Si no respira, inicia RCP.",
            ],
            donts: [
                "No provoques el vómito.",
                "No le des leche, aceite ni otros \"antídotos\" caseros.",
            ],
            callWhen: [
                "Siempre que sospeches una intoxicación, aunque la persona parezca estar bien.",
            ]
        ),
        FirstAidTopic(
            id: "golpe-calor",
            title: "Golpe de calor",
            summary: "Piel caliente, confusión y temperatura muy alta.",
            symbolName: "sun.max.fill",
            tint: .systemOrange,
            category: .injuries,
            keywords: ["insolacion", "calor", "deshidratacion", "temperatura", "sol"],
            steps: [
                "Lleva a la persona a la sombra o a un lugar fresco.",
                "Si está confundida o muy caliente, llama al 911.",
                "Quítale el exceso de ropa.",
                "Enfríala rápido: mójala con agua fresca, coloca compresas frías en cuello, axilas e ingles y abanícala.",
                "Si está consciente y puede tragar, dale sorbos de agua fresca o suero oral.",
            ],
            donts: [
                "No le des alcohol ni bebidas con cafeína.",
                "No le des líquidos si está confundida o inconsciente.",
            ],
            callWhen: [
                "Hay confusión, desmayo o convulsiones.",
                "La piel está muy caliente y seca, o la persona deja de sudar.",
            ]
        ),
        FirstAidTopic(
            id: "hipotermia",
            title: "Hipotermia",
            summary: "Temblores, piel fría, confusión por exposición al frío.",
            symbolName: "thermometer.snowflake",
            tint: .systemCyan,
            category: .injuries,
            keywords: ["frio", "congelamiento", "temperatura baja", "temblores"],
            steps: [
                "Lleva a la persona a un lugar cálido y protegido.",
                "Retírale la ropa mojada con cuidado.",
                "Cúbrela con mantas secas, incluida la cabeza, y aíslala del suelo.",
                "Si está consciente y puede tragar, dale bebidas calientes y dulces sin alcohol.",
                "Aplica calor gradual en el tronco (pecho, cuello, ingles), no en brazos y piernas.",
            ],
            donts: [
                "No frotes ni masajees sus brazos o piernas.",
                "No uses agua muy caliente ni aparatos de calor directo sobre la piel.",
                "No le des alcohol.",
            ],
            callWhen: [
                "Deja de temblar a pesar del frío, está confundida o somnolienta.",
                "Habla arrastrando las palabras o su respiración es lenta.",
            ]
        ),
        FirstAidTopic(
            id: "picaduras",
            title: "Picaduras y mordeduras",
            summary: "Abejas, alacranes, arañas, serpientes, perros y otros animales.",
            symbolName: "ant.fill",
            tint: .systemBrown,
            category: .injuries,
            keywords: ["picadura", "mordedura", "abeja", "avispa", "alacran", "escorpion", "arana", "serpiente", "vibora", "perro", "rabia"],
            steps: [
                "Aléjate a ti y a la persona del animal.",
                "Si quedó un aguijón, retíralo raspando con el borde de una tarjeta.",
                "Lava la zona con agua y jabón (en mordeduras de animales, durante 15 minutos).",
                "Aplica frío envuelto en una tela para reducir el dolor y la hinchazón.",
                "Vigila signos de reacción alérgica grave durante la siguiente hora.",
            ],
            tips: [
                "Serpiente o alacrán: mantén a la persona quieta y tranquila, con la extremidad inmóvil y a la altura del corazón, retira anillos o ropa ajustada y busca atención médica de inmediato.",
                "Si es posible, toma una foto del animal desde una distancia segura para identificarlo.",
            ],
            donts: [
                "No succiones el veneno ni hagas cortes.",
                "No pongas torniquete en mordeduras de serpiente.",
                "No apliques hielo directamente ni remedios caseros.",
            ],
            callWhen: [
                "Dificultad para respirar, hinchazón de cara o garganta, o mareo (ver Reacción alérgica grave).",
                "Picadura de alacrán, araña venenosa o mordedura de serpiente.",
                "Mordedura de perro, gato u otro animal (riesgo de rabia e infección).",
            ]
        ),

        // MARK: Técnicas básicas
        FirstAidTopic(
            id: "posicion-lateral",
            title: "Posición lateral de seguridad",
            summary: "Para una persona inconsciente que respira normalmente.",
            symbolName: "person.fill.turn.right",
            tint: .systemGreen,
            category: .techniques,
            keywords: ["posicion de recuperacion", "inconsciente", "respira", "vomito", "lateral"],
            steps: [
                "Arrodíllate a un lado de la persona, que debe estar boca arriba.",
                "Coloca el brazo más cercano a ti en ángulo recto, con la palma hacia arriba.",
                "Pon el otro brazo cruzado sobre su pecho, con el dorso de la mano contra su mejilla más cercana a ti.",
                "Dobla la rodilla más lejana y, sujetándola junto con el hombro, gira a la persona hacia ti.",
                "Inclina su cabeza ligeramente hacia atrás para mantener la vía aérea abierta.",
                "Comprueba que sigue respirando y vigílala hasta que llegue la ayuda.",
            ],
            donts: [
                "No la muevas si sospechas lesión de cuello o columna, salvo que corra peligro o vomite.",
                "No la dejes sola.",
            ],
            callWhen: [
                "Siempre que una persona esté inconsciente.",
                "Si deja de respirar normalmente, inicia RCP.",
            ]
        ),
    ]
}
