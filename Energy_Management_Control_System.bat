@echo off
setlocal enabledelayedexpansion

:: Initialize energy level and defense status
set energy_level=100
set defense_status=0

:main_menu
cls
echo ============================================
echo          Gossett Space Drones Energy Management
echo ============================================
echo Energy Level: %energy_level%
echo Defense Status: %defense_status%
echo --------------------------------------------
echo 1. Expel Energy from Pyrotechnics
echo 2. Activate Defense System
echo 3. Exit
echo ============================================
set /p choice=Please choose an option (1-3): 

if %choice%==1 goto expel_energy
if %choice%==2 goto activate_defense
if %choice%==3 goto end

:: Invalid choice, loop back to main menu
goto main_menu

:expel_energy
cls
echo --------------------------------------------
echo           Expel Energy
echo --------------------------------------------
echo Energy expulsion initiated for flight.
:: Reduce energy level
set /a energy_level-=10
echo Energy level reduced by 10.
:: Defense status impacted by energy expulsion
set /a defense_status+=5
echo Defense status increased by 5.
pause
goto main_menu

:activate_defense
cls
echo --------------------------------------------
echo           Activate Defense
echo --------------------------------------------
if %defense_status% GEQ 10 (
    echo Defense system activated.
    :: Reset defense status
    set defense_status=0
) else (
    echo Insufficient defense status to activate defense system.
)
pause
goto main_menu

:end
echo Exiting Gossett Space Drones Energy Management System.
pause
endlocal
exit
