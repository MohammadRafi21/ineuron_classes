# number_of_mentor = 0 (this is global property)
class Mentor_New2:

    number_of_mentor = 0 # now this a variable of class not the instance
                        # this is a class property
    def __init__(self, name, number,NID):
        
        self.name = name
        #self.number = number
        self.__number = number # this "__" makes it private
        self.__NID = NID
        self.company = "Ineuron"
        Mentor_New2.number_of_mentor = Mentor_New2.number_of_mentor +1

    def __str__(self):
        print(self.name)
        print(self.__number)
        return ""
    def get_Mobile(self):  #getter (getting the private instance number)
        print(self.__number)
        return self.__number
    def set_Mobile(self, newNumber, password): #setter (setting the private instance number)
        if (password=="0123"):
            self.__number = newNumber
    def get_NID(self):  #getter (getting the private instance NID)
        print("*******" + self.__NID[-1])
        #return self.__NID
    def set_NID(self, newNID): #setter (setting the private instance NID)
        if(type(newNID) == str):
            self.__NID = newNID
        else:
            print("Please provide a string NID")
    def getNIDforUN(self):
        return "BD" + self.__NID
