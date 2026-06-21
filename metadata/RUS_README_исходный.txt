# Dawncraft — Русская локализация

## Установка русской локализации

### Способ 1: Встроенный русский язык Minecraft
1. Запустите Minecraft через PrismLauncher
2. Нажмите `F3 + S` для перезагрузки ресурсов
3. Перейдите в `Настройки → Язык → Русский`

### Способ 2: Моды-локализаторы (рекомендуется)
Установите следующие моды для полной русификации интерфейса:

- **Better F3** — русификация экрана F3
- **Controlling** — уже установлен, поддерживает русский язык
- **Jade** — русификация подсказок (Jade)
- **REI (Roughly Enough Items)** — русификация крафтов
- **JourneyMap** — русификация карты
- **FTB Quests** — русский язык через мод `FTB Quests Russian`
- **Waystones** — русификация вайпостойлов
- **Create** — русский язык через мод `Create Russian Language`
- **Alex's Mobs** — русский язык через мод `Alex's Mobs Russian Translation`
- **Immersive Weathering** — русификация
- **Quark** — поддерживает русский язык
- **Sophisticated Backpacks** — русификация через P3pp3rF1y's translations
- **Patchouli** — русификация книг
- **Iron's Spells 'n Spellbooks** — русский язык
- **Epic Fight** — русификация через мод `Epic Fight Russian Language`
- **Darker Souls** — русификация
- **Blood And Madness** — русификация
- **Mowzie's Mobs** — русификация
- **Blue Skies** — русификация
- **Incendium** — русификация
- **Terralith** — русификация
- **When Dungeons Arise** — русификация
- **Structory** — русификация
- **Hexerei** — русификация
- **Guard Villagers** — русификация
- **YUNG's моды** — русификация через совместимые переводы

### Способ 3: Прямая замена файлов (для продвинутых)
1. Скачайте переводы с CurseForge для нужных модов
2. Поместите `.json` файлы локализации в:
   ```
   .minecraft/mods/<mod-id>/assets/<mod-id>/lang/ru_ru.json
   ```
3. Или используйте архив overrides — добавьте файлы в папку overrides и пересоберите модпак

## Что уже русифицировано в этом пакете:

- ✅ Название инстанса: `DawnCraft — Эхо Легенд`
- ✅dcclasses: базовая русификация классов
- ✅ Fancymenu: русификация меню (файл ru_ru.local)

## Пересборка модпака с русской локализацией

После добавления русских `.json` файлов локализации в `flame/overrides/`:

```powershell
# Создайте ZIP-архив из содержимого overrides
Compress-Archive -Path "flame/overrides/*" -DestinationPath "flame/overrides.zip" -Force
```

Затем обновите `flame/manifest.json`, убедившись, что overrides.zip включён в пакет.

## Ссылки на переводы с CurseForge

- [FTB Quests Russian Language](https://www.curseforge.com/minecraft/mc-mods/ftb-quests-russian-translation)
- [Create Russian Language](https://www.curseforge.com/minecraft/mc-mods/create-russian-language)
- [Alex's Mobs Russian Translation](https://www.curseforge.com/minecraft/mc-mods/alexs-mobs-russian-translation)
- [Epic Fight Russian Language](https://www.curseforge.com/minecraft/mc-mods/epic-fight-russian-language)
- [Better F3](https://www.curseforge.com/minecraft/mc-mods/better-f3)
- [Iron's Spells Russian](https://www.curseforge.com/minecraft/mc-mods/irons-spells-russian-translation)
- [Mowzie's Mobs Russian](https://www.curseforge.com/minecraft/mc-mods/mowzies-mobs-russian-translation)
- [Darker Souls Russian](https://www.curseforge.com/minecraft/mc-mods/darker-souls-russian-translation)
- [Quark Russian](https://www.curseforge.com/minecraft/mc-mods/quark-russian-translation)
- [Waystones Russian](https://www.curseforge.com/minecraft/mc-mods/waystones-russian-translation)
- [Jade Russian](https://www.curseforge.com/minecraft/mc-mods/jade-russian-translation)
- [Better Third Person RU](https://www.curseforge.com/minecraft/mc-mods/better-third-person)

## Примечания

- Некоторые моды автоматически подхватывают `ru_ru.json` из своей папки `assets/<mod>/lang/`
- Переводы FTB Quests требуют отдельного мода-переводчика или ручного редактирования `.snbt` файлов
- После добавления новых переводов нажмите `F3 + S` для перезагрузки ресурсов
