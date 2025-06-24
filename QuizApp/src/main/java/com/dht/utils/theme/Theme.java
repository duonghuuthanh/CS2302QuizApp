/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Enum.java to edit this template
 */
package com.dht.utils.theme;

/**
 *
 * @author admin
 */
public enum Theme {
    DEFAULT {
        @Override
        public void updateTheme() {
            ThemeManager.setThemeFactory(new DefaultThemeFactory());
        }
    }, DARK {
        @Override
        public void updateTheme() {
            ThemeManager.setThemeFactory(new DarkThemeFactory());
        }
    }, LIGHT {
        @Override
        public void updateTheme() {
            ThemeManager.setThemeFactory(new LightThemeFactory());
        }
    };
    
    public abstract void updateTheme();
}
