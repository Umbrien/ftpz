def round2(num):
    f = 100
    return round(num * f) / f


def volumeCoefficient(v: int) -> float:
    if (v <= 50):
        return 0.6
    elif (v <= 70):
        return 1.0
    elif (v <= 100):
        return 1.1
    elif (v <= 120):
        return 1.2
    elif (v <= 150):
        return 1.4
    else:
        return 1.6


def ageCoefficient(age: int, experience: int) -> float:
    if (age <= 22 and experience <= 3):
        return 1.8
    elif (age <= 22):
        return 1.6
    elif (age <= 3):
        return 1.7
    else:
        return 1


def tarif(volume: int, age: int, experience: int) -> float:
    base = 227.37
    volume = volumeCoefficient(volume)
    age = ageCoefficient(age, experience)
    return round2(base * volume * age)


if (__name__ == "__main__"):
    volume = int(input("Engine volume: "))
    age = int(input("Driver's age: "))
    experience = int(input("Driver's experience: "))
    price = tarif(volume, age, experience)
    print("Tarif: ", price)
