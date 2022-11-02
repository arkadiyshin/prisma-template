```mermaid
erDiagram

        Roles {
            manager manager
inspector inspector
        }
    


        UserStates {
            active active
inactive inactive
        }
    
  User {
    Int id PK 
    String email  
    String username  "nullable"
    String hash_password  "nullable"
    Roles role  "nullable"
    UserStates state  "nullable"
    String token  "nullable"
    DateTime created_at  
    DateTime confirmed_at  "nullable"
    }
  

  Case {
    Int id PK 
    DateTime created_at  
    DateTime assigned_at  "nullable"
    DateTime agreeded_at  "nullable"
    String client_first_name  "nullable"
    String client_email  
    String address  
    Int floor  
    Int elevator  
    Float squaremeters  
    Int quantity  
    String way_to_property  
    Int type_of_property_id  "nullable"
    Int state_id  "nullable"
    Int manager_id  "nullable"
    Int inspector_id  "nullable"
    }
  

  TypeOfProperty {
    Int id PK 
    String title  
    }
  

  CaseState {
    Int id PK 
    String title  
    }
  

  CaseItem {
    Int id PK 
    Int case_id  
    Int room  
    String room_title  "nullable"
    String description  "nullable"
    Int quantity  
    }
  

  CasePhoto {
    Int id PK 
    Int case_id  
    Int room  
    Bytes photo  
    }
  

  Appointment {
    Int id PK 
    DateTime date  
    DateTime time_from  
    DateTime time_to  
    Int case_id  
    }
  

  CaseHistory {
    Int id PK 
    DateTime time  
    Int case_id  
    Int case_state_id  
    Int case_new_state_id  
    Int user_id  
    String description  "nullable"
    Json case_data  "nullable"
    }
  

  Transition {
    Int id PK 
    Int state_id  
    Int next_state_id  
    }
  

  TransitionAccess {
    Roles role  
    Int transition_id  
    }
  
    User o|--|o Roles : "enum:role"
    User o|--|o UserStates : "enum:state"
    Case o{--|o TypeOfProperty : "TypeOfProperty"
    Case o{--|o CaseState : "State"
    Case o{--|o User : "Manager"
    Case o{--|o User : "Inspector"
    CaseItem o{--|| Case : "Case"
    CasePhoto o{--|| Case : "Case"
    Appointment o{--|| Case : "Case"
    CaseHistory o{--|| Case : "Case"
    CaseHistory o{--|| CaseState : "CaseState"
    CaseHistory o{--|| CaseState : "CaseNewState"
    CaseHistory o{--|| User : "User"
    Transition o{--|| CaseState : "State"
    Transition o{--|| CaseState : "NextState"
    TransitionAccess o|--|| Roles : "enum:role"
    TransitionAccess o{--|| Transition : "Transition"
```
