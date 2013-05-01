
Neighborcolors = [ "R", "R", "G", "R", "B", "R", "G", "B", "B", "G", "R", "G", "G"]

p = input("Enter a number between 0 and 100 for the percent: ")

def ShouldIStay(Neighborcolors, p):
    numG = Neighborcolors.count("G")
    numR = Neighborcolors.count("R")
    lenColor = len(Neighborcolors)
    percG = float(numG)/lenColor*100
    percR = float(numR)/lenColor*100

    # "G" = 0
    # if list() = "G" :
    #     "G" = "G" + 1
    #     return list.count("G")
    # "R" = 0
    # if list() = "R":
    #     "R" = "R" + 1
    #     return list.count("R")
    # if "G" // len(Neighborcolors) < p or "R" >= 3 :
    #     print "Get out of here"
    # else:
    #     print "I am happy"

ShouldIStay(Neighborcolors, p)
