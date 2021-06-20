import Foundation

class CoronaClass {
 
     var seats = [Int]()
    
     var places = [Int]()

     init(n: Int) {
        places = [Int](repeating: 0, count: n)
     }
     
     func seat() -> Int {
        var num = 0
        
        if seats.count == 0 {
            seats.append(num)
            places[num] = 1
            seats.sort()
            return num
        }
        
        if places[0] == 0 {
            seats.append(num)
            places[num] = 1
            seats.sort()
            return num
        }
        
        if places[places.count-1] == 0 {
            num = places.count-1
            places[num] = 1
            seats.append(num)
            seats.sort()
            return num
        }
        
        var indexes = [Int]()
        var distances = [Int]()
        var counter = 0
        
        var prevIndex = -1;
        
        while counter < places.count {
            if places[counter] == 1 {
                indexes.append(counter)
                distances.append(0)
                if prevIndex >= 0 {
                    let dis = counter - prevIndex - 1
                    if dis % 2 == 0 {
                      distances[distances.count-2] = Int((dis - 1)/2)
                    }
                    else {
                        distances[distances.count-2] = Int(dis/2)
                    }
                }
                prevIndex = counter
            }
            counter += 1
        }
        
        let maxDistance = distances.max()
        let maxPos = indexes[distances.firstIndex(of: maxDistance!)!]
        
        num = maxPos + maxDistance! + 1
        
        var cnt = num
        
        while (cnt < places.count) {
            if (places[cnt] == 1) {
                num += 1
            }
            else {
                break
            }
            cnt += 1
        }

        places[num] = 1
        seats.append(num)
        seats.sort()
        
        return num
     }
     
     func leave(_ p: Int) {
        if (places[p] == 1) {
            places[p] = 0
            let ind = seats.firstIndex(of: p)
            if (ind != nil) {
                seats.remove(at: ind!)
            }
        }
     }
}
