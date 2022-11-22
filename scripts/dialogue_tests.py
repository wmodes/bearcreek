

characters = [
    {"name": "Dad", "location": "out of play"},
    {"name": "Joseph", "location": "out of play"},
    {"name": "pet_rock", "location": "Limbo"},
    {"name": "counter lady", "location": "Snack Bar"},
    {"name": "Honey", "location": "Grassy Clearing"},
    {"name": "Grandpa", "location": "Grassy Clearing"},
    {"name": "Sharon", "location": "D Loop"},
    {"name": "Lee", "location": "C Loop"},
    {"name": "Mary", "location": "Grandpas Trailer"},
    {"name": "Sheriff", "location": "Limbo"},
    {"name": "Mom", "location": "Car With Mom"},
    {"name": "Stepdad", "location": "Camaro"},
    {"name": "dog", "location": "Dirt Road"},
    {"name": "dream_dog", "location": "Dream Dirt Road"},
    {"name": "yellow tabby", "location": "D Loop"}
]

topics = [
    "Mary",
    "Dad",
    "Grandpa",
    "Honey",
    "Joseph",
    "Lee",
    "Me",
    "Mika",
    "Mom",
    "Sharon",
    "Sheriff",
    "Stepdad",
    "ants",
    "berries",
    "bridge",
    "bucket",
    "cat",
    "cigarettes",
    "creek",
    "death",
    "dog",
    "dream dog",
    "dreams",
    "family",
    "forest",
    "grandpas shirt",
    "indians",
    "jam",
    "life",
    "love",
    "lucky penny",
    "lunch",
    "movie",
    "nest",
    "pail",
    "penny",
    "purple heart",
    "radio",
    "swimming",
    "tea",
    "trailer",
    "train",
    "big tree",
    "war",
    "work"
]

rants = [
    "Honey->Sharon",
    "Honey->Dad",
    "Honey->stepdad",
    "Grandpa->Sharon",
    "Grandpa->Mom",
    "Grandpa->Dad",
    "Sharon->Lee",
    "Sharon->stepdad",
    "Sharon->cat",
    "Lee->cat",
    "Lee->war",
    "Lee->indians",
    "dream_dog->work",
    "dream_dog->dog",
    "dream_dog->mom",
    "dream_dog->dad",
    "dream_dog->family",
]

char_str = ""
for character in characters:
    char_str +=  f"{character['name']}, "
print (f"Characters: {char_str}\n")

# get name
name = input("who do you want to test: ").lower()

# find name in list of dicts
name_dict = next((item for item in characters if item["name"].lower() == name), None)

if not name_dict:
    print (f"\nName {name} not found in list, try again?\n")
    exit (1)

if name_dict["location"].lower() == "out of play":
    print (f"\n{name} is \"out of play\" so no interactions are possible.\n")
    exit(0)

if name_dict["location"].lower() == "limbo":
    print (f"\n({name} is in \"Limbo\" but we can go visit them there.)\n")
    
preamble = f"Chapter - Tests\n\n"
ask_cmd = f"test {name}-ask with \"teleport to {name_dict['location']} / ";
tell_cmd = f"test {name}-tell with \"teleport to {name_dict['location']} / ";
for topic in topics:
    if f"{name}->{topic}".lower() in map(str.lower, rants):
        map_flag = True;
    else:
        map_flag = False;
    ask_cmd += f"ask {name} about {topic} / ";
    if map_flag: 
         ask_cmd += "z / z / z / "
    tell_cmd += f"tell {name} about {topic} / ";
    if map_flag: 
         tell_cmd += "z / z / z / "
ask_cmd += "\".\n"
tell_cmd += "\".\n"

print ("\nAdd the following to I7 source:\n")
print (f"{preamble}{ask_cmd}\n{tell_cmd}")

# egrep -i "response of|rant is in-progress" story.ni

