package seedswap

class Seed {
    String name
    String scientificName
    int hardiness
    String specialRequirements
    String growingTips
    String harvestingInfo
    Date growingSeason

    static belongsTo = [farmer:Farmer]

    def String toString(){ name }

    static constraints = {
        name name:true, blank:false
        scientificName scientificName:true, blank:false
        hardiness max:7
        specialRequirements nullable:true, widget:'textarea'
        growingTips nullable:true, widget:'textarea'
        harvestingInfo nullable:true, widget:'textarea'
        growingSeason nullable:true
    }
}
