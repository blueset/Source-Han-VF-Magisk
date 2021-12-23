# Source Han VF Magisk
A module replace CJK fonts to Source Han Variable.

~~Sister module: [Noto-CJK-VF-Magisk](https://github.com/WordlessEcho/Noto-CJK-VF-Magisk)~~

## Modified content
Renamed font files to `NotoSansCJK-Redular.ttc` and `NotoSerifCJK-Regular.ttc`, both of which already exist in the system.

This is an attempt to resolve the issue where apps in MagiskHide/DenyList crashes when trying to render texts in CJK on Android 12.

> Starting from Android 12, font files are only loaded on demand (when rendering relevant UI components), referring to any font file not already existing in the system pre-Magisk would lead to such apps to crash due to inability to find such font file. This would render any Magisk packages introducing font file with new names unusable with such apps.

[Relevant issue](https://github.com/WordlessEcho/Source-Han-VF-Magisk/issues/4)

## Requirement
~~Android 8.0 and above. 9.0 for serif support.~~
Android 12 running on Google Pixel phones (tested on Pixel 6 Pro).

## Advantage
Compare to normal super OTC version, only 38.9MB for all weight.

## Try variable
[Variable Font Test](https://github.com/WordlessEcho/Variable-Font-Test)
![App Preview](https://github.com/WordlessEcho/Variable-Font-Test/blob/main/doc/pics/variable-font-test-zh-tw.gif?raw=true)

## Font
Both font had been modified with [subset_noto_cjk.py](https://cs.android.com/android/platform/superproject/+/master:external/noto-fonts/cjk/subset_noto_cjk.py). And add chws feature with [kojiishi/east_asian_spacing: OpenType East Asian Contextual Spacing Build Tools](https://github.com/kojiishi/east_asian_spacing).

### Source Han Sans VF download
[source-han-sans/Variable at release · adobe-fonts/source-han-sans](https://github.com/adobe-fonts/source-han-sans/tree/release/Variable)

### Source Han Serif VF download
[source-han-serif/Variable at release · adobe-fonts/source-han-sans](https://github.com/adobe-fonts/source-han-serif/tree/release/Variable)

## wght value
Tools: [googlefonts/fonttools: A library to manipulate font files from Python.](https://github.com/googlefonts/fonttools)
See also: [fvar — Font Variations Table (OpenType 1.8.4) - Typography | Microsoft Docs](https://docs.microsoft.com/en-us/typography/opentype/spec/fvar#instancerecord)

```bash
# SC as a example. They were same.
ttx -y 3 -t fvar SourceHanSans-VF.ttc
```
```xml
  <fvar>

    <!-- Weight -->
    <Axis>
      <AxisTag>wght</AxisTag>
      <Flags>0x0</Flags>
      <MinValue>250.0</MinValue>
      <DefaultValue>250.0</DefaultValue>
      <MaxValue>900.0</MaxValue>
      <AxisNameID>265</AxisNameID>
    </Axis>

    <!-- ExtraLight -->
    <!-- PostScript: SourceHanSansSCVF-ExtraLight -->
    <NamedInstance flags="0x0" postscriptNameID="267" subfamilyNameID="266">
      <coord axis="wght" value="250.0"/>
    </NamedInstance>

    <!-- Light -->
    <!-- PostScript: SourceHanSansSCVF-Light -->
    <NamedInstance flags="0x0" postscriptNameID="269" subfamilyNameID="268">
      <coord axis="wght" value="300.0"/>
    </NamedInstance>

    <!-- Normal -->
    <!-- PostScript: SourceHanSansSCVF-Normal -->
    <NamedInstance flags="0x0" postscriptNameID="271" subfamilyNameID="270">
      <coord axis="wght" value="350.0"/>
    </NamedInstance>

    <!-- Regular -->
    <!-- PostScript: SourceHanSansSCVF-Regular -->
    <NamedInstance flags="0x0" postscriptNameID="273" subfamilyNameID="272">
      <coord axis="wght" value="400.0"/>
    </NamedInstance>

    <!-- Medium -->
    <!-- PostScript: SourceHanSansSCVF-Medium -->
    <NamedInstance flags="0x0" postscriptNameID="275" subfamilyNameID="274">
      <coord axis="wght" value="500.0"/>
    </NamedInstance>

    <!-- Bold -->
    <!-- PostScript: SourceHanSansSCVF-Bold -->
    <NamedInstance flags="0x0" postscriptNameID="277" subfamilyNameID="276">
      <coord axis="wght" value="700.0"/>
    </NamedInstance>

    <!-- Heavy -->
    <!-- PostScript: SourceHanSansSCVF-Heavy -->
    <NamedInstance flags="0x0" postscriptNameID="279" subfamilyNameID="278">
      <coord axis="wght" value="900.0"/>
    </NamedInstance>
  </fvar>
```
