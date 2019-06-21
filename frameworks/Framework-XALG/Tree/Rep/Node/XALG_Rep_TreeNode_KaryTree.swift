//
//  XALG_Rep_TreeNode_KaryTree.swift
//  XALG
//
//  Created by Juguang Xiao on 06/03/2017.
//

import Swift
import Foundation


struct XALG_Rep_TreeNode_KaryTree<Payload> : XALG_ADT_TreeNode_KaryTree, Hashable
where Payload : Hashable {
    typealias NodeType = XALG_Rep_TreeNode_KaryTree // XALG_Rep_TreeNode_KaryTree<PayloadType>
    
    
    typealias PayloadType = Payload
    
    typealias IndexType = Int
    
    var index: Int {
        return 1
        //        return ObjectIdentifier(self).hashValue
    }
    
    var child_ = [NodeType]()
    
    let payload : PayloadType
    
    init(payload p : PayloadType) {
        payload = p
    }
    
//    var object : NSObject!
    
    var depth : Int = -1
    mutating func preorder(_ n : NodeType) {
        depth += 1
        print("[\(depth)]" , n.payload ) // , TreeTraveral_levelorder.height(n))
        n.child_.forEach {
            
            self.preorder($0)
        }
    }
    
    
    
}

extension XALG_ADT_TreeNode_KaryTree  {
    
//    var hashValue: Int {
//        return payload.hashValue
//    }
    
    static func ==(lhs: Self, rhs: Self) -> Bool {
        return lhs.payload == rhs.payload
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(payload)
    }
}

