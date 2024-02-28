--[[
    STUDY 3H

    제작목표: 모터100

    분석 1차
        조립기 모터
            IN 회전자 2 10/min
            IN 고정자 2 10/min
            OUT 모터 1 5/min
        조립기 회전자
            IN 철봉 5 20/min
            IN 나사 25 100/min
            OUT 회전자 1 4/min
        조립기 고정자
            IN 강철파이프 3 15/min
            IN 전선 8 40/min
            OUT 고정자 1 5/min
        제작기 철봉
            IN 철괴 1 15/min
            OUT 철봉 1 15/min
        제작기 나사
            IN 철봉 1 10/min
            OUT 나사 4 40/min
        제작기 강철파이프
            IN 강철주괴 3 30/min
            OUT 강철파이프 2 20/min
        제작기 전선
            IN 구리괴 1 15/min
            OUT 전선 2 30/min
        주조소 강철주괴
            IN 철광석 3 45/min
            IN 석탄 3 45/min
            OUT 강철주괴 3 45/min
        제련기 철괴
            IN 철광석 1 30/min
            OUT 철괴 1 30/min
        제련기 구리괴
            IN 구리광석 1 30/min
            OUT 구리주괴 1 30/min

    분석 2차
        INPUT = 철괴2250 + 강철주괴900 + 구리괴800
        전선1600 = 구리괴800
        강철파이프600 = 강철주괴900
        나사5000 = 철봉1250 = 철괴1250
        철봉1000 = 철괴1000
        고정자200 = 강철파이프600 + 전선1600
        회전자200 = 철봉1000 + 나사5000
        모터100 = 회전자200 + 고정자200

    분석 3차
        Belt : MK1(60/min), MK2(120/min), MK3(270/min)

        제작기 9EA (270/30=9)
            IN 구리괴800 1 15/min
            OUT 전선1600 2 30/min
        
        제작기 6EA (120/20=6)
            IN 강철주괴900 3 30/min
            OUT 강철파이프600 2 20/min

        제작기 18EA (120/15=18)
            IN 철괴2250 1 15/min
            OUT 철봉2250 1 15/min

        제작기 3EA (120/40=3)
            IN 철봉1250 1 10/min
            OUT 나사5000 4 40/min
        
        조립기 12EA (60/5=12)
            IN 강철파이프600 3 15/min
            IN 전선1600 8 40/min
            OUT 고정자200 1 5/min
        
        조립기 15EA (60/4=15)
            IN 철봉1000 5 20/min
            IN 나사5000 25 100/min
            OUT 회전자200 1 4/min

        조립기 12EA (60/5=12)
            IN 회전자200 2 10/min
            IN 고정자200 2 10/min
            OUT 모터100 1 5/min
    
    분석 4차
    
        제작기1개당 소요시간
        IN CopperIngot800 1 OUT Wire1600 2: 3200sec
        IN SteelIngot900 3 OUT SteelPipe600 2: 600sec
        IN IronIngot2250 1 OUT IronRod2250 1: 9000sec
        IN IronRod1250 1 OUT Screw5000 4: 7500sec
        IN SteelPipe600 3 IN Wire1600 8 OUT Stator200: 800sec
        IN IronRod1000 5 IN Screw5000 25 OUT Rotor200: 600sec
        IN Rotor200 2 IN Stator200 2 OUT Moter100: 600sec

    BATCH
        1. IN Rotor200 IN Stator200 OUT Moter100
        1-1. IN SteelPipe600 IN Wire1600 OUT Stator200
        1-1-1. IN CopperIngot800 OUT Wire1600
        1-1-2. IN SteelIngot900 OUT SteelPipe600 (MAX15EA, MOD 900count/(3ea-input*3eaConstructor*5Set) = 0)
        1-2. IN IronRod1000 5 IN Screw5000 25 OUT Rotor200
        1-2-1. IN IronIngot2250 1 OUT IronRod2250
        1-2-2. IN IronRod1250 1 OUT Screw5000

        BELT: LIMIT MK1~3 (60,120,270)

        Assembler[1~3]
        Constructor[1~15]
]]--


