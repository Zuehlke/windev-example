# How to use the [windev-cookbook](https://github.com/zuehlke/cookbook-windev)

The windev cookbook is a library cookbook aimed at the provisioning of Windows development environments.

This example provisions a Windows 7 64x instance with some basic OS software (Ruby, git, SlikSVN, Python, Sublime Text and Process Explorer) in an effort to showcase the usage of the windev cookbook's elements.

## Requirements

 * Windows 7 64x
 * [ChefDK](https://opscode-omnibus-packages.s3.amazonaws.com/windows/2008r2/x86_64/chefdk-0.7.0-1.msi)
 * Network connectivity (with full internet access)

## Usage

Clone this repository.

Either install the [ChefDK](https://opscode-omnibus-packages.s3.amazonaws.com/windows/2008r2/x86_64/chefdk-0.7.0-1.msi) beforehand or copy the installer in the software/ subdirectory. Use the version linked in this document.

Open a cmd.exe console and type

```
chef.cmd dev.json
```

## Boilerplate and mechanics

The windev cookbook is used as a library cookbook. The main cookbook in this example is called vm. Dependencies are pulled via berkshelf and are vendored, not installed globally.

The vm cookbook has a rudimentary gem installation recipe for illustration purposes.

Chef is used in chef-zero mode and the scripts/client.rb contains the necessary configuration. Also to make sure that nothing interferes with the process the environment is explicitly set in scripts/env.cm (in this example only PATH).

scripts/chef-check.cmd is a bit of dos batch code to check that chef is present and attempt to install if not. Minimizes the installation instructions to "copy the ChefDK installer to the software/ subrdirectory and run".

All of this makes wrapping the Chef invocation in dos batch code necessary, which is what chef.cmd does.

The trick with SUBST (substituting a drive letter for the working path of the scripts) is useful when running said script as a provisioning step in a Vagrant configuration (where the network share is not otherwise accessible from DOS).

## The gems recipe

This is an example of a quick and dirty recipe that is "good enough", meaning it works with the assumptions and prerequisites established for this one specific usage:

Knowing that Ruby is installed and the PATH is set via windev, the vm:gems recipe leverages bundler to install a list of gems from Gemfile pulled from the cookbook files.

## Best practices

Download all the installers and host them within your network, i.e. in an FTP server or a server like Archiva or Artefactory. Then update the URLs in the roles/*.json files.

The example downloads and caches all installers in c:\tools\installers. Once it runs, you will have all the installers in one place.

## Resources

 * [cookbook-windev](https://github.com/zuehlke/cookbook-windev)
 * [Chef documentation](http://docs.getchef.com/)
