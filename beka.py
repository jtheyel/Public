
def ShouldIStay(Neighborcolors, p):
    numG = Neighborcolors.count("G")
    numR = Neighborcolors.count("R")
    lenColor = len(Neighborcolors)
    percG = float(numG)/lenColor*100
    percR = float(numR)/lenColor*100
    if percR < p or percG < p:
        print "Get out of here"
    else:
        print "I'm happy"

Neighborcolors = [ "R", "R", "G", "R", "B", "R", "G", "B", "B", "G", "R", "G", "G"]
p = input("Enter a number between 0 and 100 for the percent: ")
ShouldIStay(Neighborcolors, p)
