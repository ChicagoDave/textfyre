#!/usr/bin/env python3

# Usage: python3 makedist.py
#
# This script copies the working files (everything needed to run Lectrote)
# into prebuilt Electron app packages. Fetch these from
#    https://github.com/atom/electron/releases
# and unzip them into a "dist" directory.

import sys
import os, os.path
import optparse
import shutil
import json
import subprocess

all_packages = [
    'darwin-x64',
    'linux-ia32',
    'linux-x64',
    'win32-ia32',
    'win32-x64',
]

popt = optparse.OptionParser()

popt.add_option('-b', '--build',
                action='store_true', dest='makedist',
                help='build dist directories')
popt.add_option('-z', '--zip',
                action='store_true', dest='makezip',
                help='turn dist directories into zip files')
popt.add_option('-n', '--none',
                action='store_true', dest='makenothing',
                help='do nothing except look at the arguments')
popt.add_option('-g', '--game', '--gamedir',
                action='store', dest='gamedir',
                help='directory for game-specific files')
popt.add_option('-v', '--version',
                action='store', dest='buildversion',
                default='1',
                help='build version (default 1)')

(opts, args) = popt.parse_args()


appfiles = [
    './package.json',
    './main.js',
    './apphooks.js',
    './formats.js',
    './play.html',
    './prefs.html',
    './prefs.js',
    './fonts.js',
    './about.html',
    './if-card.html',
    './if-card.js',
    './fonts.css',
    './play.css',
    './el-glkote.css',
    './font',  # all files
    './icon-128.png',
    './docicon-glulx.ico',
    './docicon-zcode.ico',
    './docicon-hugo.ico',
    './docicon-json.ico',
    './quixe/lib/elkote.min.js',
    './quixe/lib/jquery-1.12.4.min.js',
    './quixe/lib/quixe.min.js',
    './quixe/media/waiting.gif',
    {
        'key': 'ifvms',
        'files': [
            './zplay.html',
            './ifvms/zvm.min.js',
            './ifvms/zvm_dispload.min.js',
            './ifvms/zvm.css',
            './ifvms/package.json',
        ]
    },
    {
        'key': 'emglken',
        'files': [
            './emglkenplay.html',
            './emglken/hugo.js',
            './emglken/hugo-core.js.bin',
            './emglken/hugo-core.js.mem',
            './emglken/git.js',
            './emglken/git-core.js.bin',
            './emglken/git-core.js.mem',
            './emglken/emglken_dispload.min.js',
            './emglken/versions.json',
        ]
    },
    {
        'key': 'inkjs',
        'files': [
            './inkplay.html',
            './inkplay.js',
            './inkjs/ink.min.js',
            './inkjs/ink-130.min.js',
            './inkjs/ink-146.min.js',
            './inkjs/package.json',
        ]
    },
]

rootfiles = [
    './LICENSE',    
    './LICENSES-FONTS.txt',
]

win32_rootfiles = [
    'LICENSE',
    'LICENSES-FONTS.txt',
]

def install(resourcedir, pkg):
    if not os.path.isdir(resourcedir):
        raise Exception('path does not exist: ' + resourcedir)
    appdir = resourcedir
    print('Installing to: ' + appdir)

    soleterp = pkg.get('lectroteSoleInterpreter')

    appfilesused = []
    for val in appfiles:
        if type(val) is dict:
            if soleterp and val['key'] != soleterp:
                continue
            for filename in val['files']:
                appfilesused.append(filename)
        else:
            appfilesused.append(val)
    
    os.makedirs(appdir, exist_ok=True)
    qdir = os.path.join(appdir, 'quixe')
    os.makedirs(qdir, exist_ok=True)
    os.makedirs(os.path.join(qdir, 'lib'), exist_ok=True)
    os.makedirs(os.path.join(qdir, 'media'), exist_ok=True)
    zvmdir = os.path.join(appdir, 'ifvms')
    os.makedirs(zvmdir, exist_ok=True)
    emglkendir = os.path.join(appdir, 'emglken')
    os.makedirs(emglkendir, exist_ok=True)
    inkdir = os.path.join(appdir, 'inkjs')
    os.makedirs(inkdir, exist_ok=True)

    for filename in appfilesused:
        srcfilename = filename
        if opts.gamedir:
            val = os.path.join(opts.gamedir, filename)
            if os.path.exists(val):
                srcfilename = val

        tgtfilename = os.path.join(appdir, filename)
        if not os.path.isdir(filename):
            if not os.path.exists(tgtfilename):
                shutil.copyfile(srcfilename, tgtfilename)
        else:
            subdirname = os.path.join(appdir, filename)
            os.makedirs(subdirname, exist_ok=True)
            for subfile in os.listdir(srcfilename):
                tgtfilename = os.path.join(subdirname, subfile)
                if not os.path.exists(tgtfilename):
                    shutil.copyfile(os.path.join(srcfilename, subfile), tgtfilename)

    extrafiles = pkg.get('lectroteExtraFiles')
    if opts.gamedir and extrafiles:
        gamedir = os.path.basename(opts.gamedir)
        os.makedirs(gamedir, exist_ok=True)
        for filename in extrafiles:
            srcfilename = os.path.join(opts.gamedir, filename)
            if not os.path.isdir(filename):
                tgtfilename = os.path.join(gamedir, filename)
                if not os.path.exists(tgtfilename):
                    shutil.copyfile(srcfilename, tgtfilename)
            else:
                subdirname = os.path.join(gamedir, filename)
                os.makedirs(subdirname, exist_ok=True)
                for subfile in os.listdir(srcfilename):
                    tgtfilename = os.path.join(subdirname, subfile)
                    if not os.path.exists(tgtfilename):
                        shutil.copyfile(os.path.join(srcfilename, subfile), tgtfilename)

def builddir(dir, pack, pkg):
    (platform, dummy, arch) = pack.partition('-')

    cmd = 'node_modules/.bin/electron-packager'

    if platform == 'win32':
        cmd = 'node_modules\.bin\electron-packager'

    args = [
        cmd, product_name, product_name,
        '--app-version', product_version,
        '--build-version', opts.buildversion,
        '--arch='+arch, '--platform='+platform,
        '--out', 'dist',
        '--overwrite'
        ]

    if platform == 'darwin':
        appid = 'com.eblong.lectrote'
        if opts.gamedir:
            appid = pkg.get('lectroteMacAppID')
            if not appid:
                raise Exception('Mac package must set lectroteMacAppID')
            if appid == 'com.eblong.lectrote':
                raise Exception('lectroteMacAppID must not be com.eblong.lectrote')

        iconpath = 'resources/appicon-mac.icns'
        if opts.gamedir and os.path.exists(os.path.join(opts.gamedir, 'resources/appicon-mac.icns')):
            iconpath = os.path.join(opts.gamedir, 'resources/appicon-mac.icns')
        
        args = args + [
            '--app-bundle-id='+appid,
            '--app-category-type=public.app-category.games',
            '--icon='+iconpath,
            '--extra-resource=resources/icon-glulx.icns',
            '--extra-resource=resources/icon-zcode.icns',
            '--extra-resource=resources/icon-hugo.icns',
            '--extra-resource=resources/icon-blorb.icns',
            '--extra-resource=resources/icon-gblorb.icns',
            '--extra-resource=resources/icon-zblorb.icns',
            '--extra-resource=resources/icon-glksave.icns',
            '--extra-resource=resources/icon-glkdata.icns',
            '--extra-resource=resources/icon-json.icns',
            '--extend-info', 'resources/Add-Info.plist',
            ]

    if platform == 'win32':
        iconpath = 'resources/appicon-win.ico'
        if opts.gamedir and os.path.exists(os.path.join(opts.gamedir, 'resources/appicon-win.ico')):
            iconpath = os.path.join(opts.gamedir, 'resources/appicon-win.ico')

        filedesc = 'Interactive Fiction Interpreter'
        if opts.gamedir and pkg.get('description'):
            filedesc = pkg.get('description')

        if not opts.gamedir:
            companyname = 'Zarfhome Software'
        else:
            companyname = pkg.get('lectroteCompanyName')
        if companyname:
            args.append('--win32metadata.CompanyName='+companyname)

        if not opts.gamedir:
            copyright = 'Copyright 2016 by Andrew Plotkin'
        else:
            copyright = pkg.get('lectroteCopyright')
        if copyright:
            args.append('--app-copyright='+copyright)
        
        args = args + [
            '--win32metadata.InternalName='+product_name,
            '--win32metadata.ProductName='+product_name,
            '--win32metadata.OriginalFilename='+product_name+'.exe',
            '--win32metadata.FileDescription='+filedesc,
            '--icon='+iconpath,
            ]

        rootfiles = win32_rootfiles
        
    subprocess.call(args, shell=True)

    for filename in rootfiles:
        shutil.copyfile(filename, os.path.join(dir, filename))
    os.unlink(os.path.join(dir, 'version'))
    
def makezip(dir, zipdir, unwrapped=False):
    prefix = product_name + '-'
    val = os.path.split(dir)[-1]
    if not val.startswith(prefix):
        raise Exception('path does not have the prefix')
    zipfile = product_name + '-' + product_version + '-' + val[len(prefix):]
    zipargs = '-q'
    if 'darwin' in zipfile:
        zipfile = zipfile.replace('darwin', 'macos')
        print('AppDMGing up: %s to %s' % (dir, zipfile))
        subprocess.call('rm -f "dist/%s.dmg"; node_modules/.bin/appdmg resources/pack-dmg-spec.json "dist/%s.dmg"' % (zipfile, zipfile),
                        shell=True)
        return
    print('Zipping up: %s to %s (%s)' % (dir, zipfile, ('unwrapped' if unwrapped else 'wrapped')))
    if unwrapped:
        if 'darwin' in zipfile:
            subprocess.call('cd "%s"; rm -f "../%s.zip"; bestzip "%s" -r "../%s.zip" *' % (dir, zipfile, zipargs, zipfile), shell=True)
        if 'win32' in zipfile:
            os.chdir('dist')
            os.chdir(zipdir)
            tgtfile = '..\%s.zip' % (zipfile)
            if os.path.exists(tgtfile):
                os.remove(tgtfile)
            subprocess.call('bestzip ..\%s.zip .\\' % (zipfile), shell=True)
            os.chdir('..\\')
            os.chdir('..\\')
    else:
        dirls = os.path.split(dir)
        subdir = dirls[-1]
        topdir = os.path.join(*os.path.split(dir)[0:-1])

        if 'darwin' in zipfile:
            subprocess.call('cd "%s"; rm -f "%s.zip"; bestzip "%s" -r "%s.zip" "%s"' % (topdir, zipfile, zipargs, zipfile, subdir), shell=True)

        if 'win32' in zipfile:
            subprocess.call('cd "%s"; del /F "%s.zip"; bestzip "%s" -r "%s.zip" "%s"' % (topdir, zipfile, zipargs, zipfile, subdir), shell=True)

# Start work! First, read the version string out of package.json.

pkgfile = 'package.json'
if opts.gamedir and os.path.exists(os.path.join(opts.gamedir, 'package.json')):
    pkgfile = os.path.join(opts.gamedir, 'package.json')
fl = open(pkgfile)
pkg = json.load(fl)
fl.close()

product_version = pkg['version']
product_name = pkg['productName'];
print('%s version: %s' % (product_name, product_version,))
if product_name != 'Lectrote':
    print('%s version: %s' % ('Lectrote', pkg['lectroteVersion'],))

# Decide what distributions we're working on. ("packages" is a bit overloaded,
# sorry.)

packages = []
if not args:
    packages = all_packages
else:
    for pack in all_packages:
        for arg in args:
            if arg in pack:
                packages.append(pack)
                break

if not packages:
    raise Exception('no packages selected')

if not opts.gamedir:
    os.makedirs('tempapp', exist_ok=True)
    install('tempapp', pkg)

if opts.gamedir:
    os.makedirs(opts.gamedir, exist_ok=True)
    install(opts.gamedir, pkg)

os.makedirs('dist', exist_ok=True)

doall = not (opts.makedist or opts.makezip or opts.makenothing)

if doall or opts.makedist:
    for pack in packages:
        (platform, dummy, arch) = pack.partition('-')

        if platform == 'win32':
            dest = 'dist\%s-%s' % (product_name, pack,)
            builddir(dest, pack, pkg)

        if platform == 'darwin':
            dest = 'dist/%s-%s' % (product_name, pack,)
            builddir(dest, pack, pkg)

if doall or opts.makezip:
    for pack in packages:
        (platform, dummy, arch) = pack.partition('-')

        if platform == 'win32':
            zippath = 'dist\%s-%s' % (product_name, pack,)
            zipdir = '%s-%s' % (product_name, pack,)
            makezip(zippath, zipdir, unwrapped=('win32' in pack))

        if platform == 'darwin':
            dest = 'dist/%s-%s' % (product_name, pack,)
            makezip(dest, '', unwrapped=('win32' in pack))