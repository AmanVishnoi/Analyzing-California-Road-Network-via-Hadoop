import random

random_list = []
for i in range(1000):
    random_list.append(str(random.randint(0, 1971278)))

with open("random_list.txt", "a") as file:
    file.writelines("\n".join(random_list))

